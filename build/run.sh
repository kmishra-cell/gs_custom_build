#!/bin/bash


function process_start()
{ 
echo "                     * * * * * * * * * * * * * * * * * * * * * * * * * * * *                     "
echo "                     *                                                     *                     "
echo "                     *                                                     *                     "
echo "                     *   Starting Build Processes for Custom Components    *                     "
echo "                     *                                                     *                     "
echo "                     *                                                     *                     "
echo "                     * * * * * * * * * * * * * * * * * * * * * * * * * * * *                     "
echo "                      Make Sure following Variables are passed to Container		       "
echo '                        $GIT_REPO_PATH      - To set Repo Path                                   '
echo '                        $GIT_USERNAME       - Service Account Username to connect repository     '
echo '                        $GIT_PASSWORD       - Service Account Password to connect repository     '
echo '                        $GIT_RELEASE BRANCH - Release branch                                     '
echo '                        $PACKAGE_VERSION    - Incremental Version of the package                 '
echo "                         ******** Non Mandatory Fields ********                                  "
echo '                        $GIT_RELEASE_TAG    - Release tag                                        '
echo '                        $MOUNT_DIR          - To copy generated packages to Mount Directory      '
}

### Main 
process_start
export BUILD_HOME=/ext/app/Edm/custom/build
export PATH=$PATH:/opt/ant/bin

echo "Checking Repository Username"

if [[ "$GIT_USERNAME" == "TEST" || -z "$GIT_USERNAME" ]]; then
	echo "ERROR !!!!!!! Provide repository Service Account Username while starting Container using GIT_USERNAME"
	exit 1
else
	echo "Service Account username is        : $GIT_USERNAME"
fi

echo "Checking Repository Password"

if [[ "$GIT_PASSWORD" == "TEST" || -z "$GIT_PASSWORD" ]]; then
	echo "ERROR !!!!!!! Provide repository Service Account Password while starting Container using GIT_PASSWORD"
	exit 1
else
	echo "Service Account password is        : ****"
fi

echo "Checking Repository Path"

if [[ "$GIT_REPO_PATH" == "TEST" || -z "$GIT_REPO_PATH" ]]; then
	echo "ERROR !!!!!!! Provide Repo Path while starting Container using GIT_REPO_PATH"
	exit 1
else
	echo "Repo Path for the Repository is    : $GIT_REPO_PATH"
fi

echo "Checking Repository Release branch Path"

if [[ "$GIT_RELEASE_BRANCH" == "TEST" || -z "$GIT_RELEASE_BRANCH" ]]; then
	echo "ERROR !!!!!!! Provide Release Branch Path while starting Container using GIT_RELEASE_BRANCH"
	exit 1
else
	echo "Release Branch Path is             : $GIT_RELEASE_BRANCH"
fi
	echo "Release Tag details                : $GIT_RELEASE_TAG"

echo "Repository Details are provided correctly"

echo "*******************************************************************************************************"
if [[ "$BUILD_HOME" == "TEST" || -z "$BUILD_HOME" ]]; then
	echo "ERROR !!!!!!! BUILD_HOME IS not set, Ideally should be set to /ext/app/Edm/custom/build"
	exit 1
else
        echo "Home Directory is set to : $BUILD_HOME"
fi

echo "Copying build.properties to respective directories"

cd $BUILD_HOME
echo "Updating Package version to $PACKAGE_VERSION"

if [[ "$PACKAGE_VERSION" == "TEST" || -z "$PACKAGE_VERSION" ]]; then
	echo "ERROR !!!!!!! Please provide Package version while starting Container using PACKAGE_VERSION"
	exit 1
else
	sed -i -e "s/\(packageVersion=\).*/\1$PACKAGE_VERSION/" build.properties
fi

cp build.properties ./custom
cp build.properties ./templates
cp build.properties ./engine

echo "Deleting tmpRepo Directory if present"
rm -rf tmpRepo

echo "Deleting Temporary files if present"
rm -f ./custom/build.xml
rm -f ./custom/PackageDescription.xml
rm -f ./custom/SCTL_Delete.sql

echo "Check-out/clone code from Repository"
cd custom
echo "java -jar BuildPackage.jar $GIT_REPO_PATH $GIT_USERNAME $GIT_PASSWORD GIT $GIT_RELEASE_BRANCH $GIT_RELEASE_TAG"
java -jar BuildPackage.jar $GIT_REPO_PATH $GIT_USERNAME $GIT_PASSWORD GIT $GIT_RELEASE_BRANCH $GIT_RELEASE_TAG

if [[ -f "build.xml" ]]; then
	echo "***************************************CLONING OF REPOSITORY SUCCESSFUL**************************"
else
	echo "******************************ERROR !!!!! PROBLEM IN CLONING, PLEASE CHECK LOGS*******************"
	exit 1
fi

echo "**********************************************Creating Packages*******************************************"

ant build
cd ../templates
ant build

if [[ "$MOUNT_DIR" == "TEST" || -z "$MOUNT_DIR" ]]; then
	echo "MOUNT DIR not defined, packages will not be copied"
	exit 1
else
	cp $BUILD_HOME/../packages/*.* $MOUNT_DIR
	echo "cp $BUILD_HOME/../packages/*.* $MOUNT_DIR"

fi

