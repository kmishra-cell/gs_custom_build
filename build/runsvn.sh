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
echo '                        $SVN_REPO_PATH      - To set Repo Path                                   '
echo '                        $SVN_USERNAME       - Service Account Username to connect repository     '
echo '                        $SVN_PASSWORD       - Service Account Password to connect repository     '
echo '                        $SVN_RELEASE BRANCH - Release branch                                     '
echo '                        $PACKAGE_VERSION    - Incremental Version of the package                 '
}

### Main 
process_start
export BUILD_HOME=/app01/CI/Nuveen/build
export SVN_USERNAME=psgdevopsuser
export SVN_PASSWORD=Gsource@987
export SVN_RELEASE_BRANCH=8.8.1.01
export SVN_REPO_PATH=http://svn/psg/Nuveen/branches/SecMaster/8.8.1.01/

echo "Checking Repository Username"

if [[ "$SVN_USERNAME" == "TEST" || -z "$SVN_USERNAME" ]]; then
	echo "ERROR !!!!!!! Provide repository Service Account Username while starting Container using SVN_USERNAME"
	exit 1
else
	echo "Service Account username is        : $SVN_USERNAME"
fi

echo "Checking Repository Password"

if [[ "$SVN_PASSWORD" == "TEST" || -z "$SVN_PASSWORD" ]]; then
	echo "ERROR !!!!!!! Provide repository Service Account Password while starting Container using SVN_PASSWORD"
	exit 1
else
	echo "Service Account password is        : ****"
fi

echo "Checking Repository Path"

if [[ "$SVN_REPO_PATH" == "TEST" || -z "$SVN_REPO_PATH" ]]; then
	echo "ERROR !!!!!!! Provide Repo Path while starting Container using SVN_REPO_PATH"
	exit 1
else
	echo "Repo Path for the Repository is    : $SVN_REPO_PATH"
fi

echo "Checking Repository Release branch Path"

if [[ "$SVN_RELEASE_BRANCH" == "TEST" || -z "$SVN_RELEASE_BRANCH" ]]; then
	echo "ERROR !!!!!!! Provide Release Branch Path while starting Container using SVN_RELEASE_BRANCH"
	exit 1
else
	echo "Release Branch Path is             : $SVN_RELEASE_BRANCH"
fi

echo "Repository Details are provided correctly"

echo "*******************************************************************************************************"
if [[ "$BUILD_HOME" == "TEST" || -z "$BUILD_HOME" ]]; then
	echo "ERROR !!!!!!! BUILD_HOME IS not set, Ideally should be set to : $BUILD_HOME"
	exit 1
else
        echo "Home Directory is set to : $BUILD_HOME"
fi

echo "Copying build.properties to respective directories"

cd $BUILD_HOME


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
echo "java -jar BuildPackage.jar $SVN_REPO_PATH $SVN_USERNAME $SVN_PASSWORD SVN $SVN_RELEASE_BRANCH"
java -jar BuildPackage.jar $SVN_REPO_PATH $SVN_USERNAME $SVN_PASSWORD SVN $SVN_RELEASE_BRANCH

echo "**********************************************Creating DW Packages*******************************************"
cp -r DW/build.xml .
cp -r DW/PackageDescription.xml .
ant build
rm -rf  ./build.xml
rm -rf  ./PackageDescription.xml
echo "**********************************************Creating GC Packages*******************************************"
cp -r ./GC/build.xml .
cp -r ./GC/PackageDescription.xml .
ant build
rm -rf ./build.xml
rm -rf ./PackageDescription.xml
echo "**********************************************Creating VD Packages*******************************************"
cp -r ./VD/build.xml .
cp -r ./VD/PackageDescription.xml .
ant build
rm -rf ./build.xml
rm -rf ./PackageDescription.xml
echo "**********************************************Creating Template Packages*******************************************"
 
cd ../templates
cp -r ../custom/UI/build.xml .
ant build
 
echo "**********************************************Creating Engine Packages*******************************************"
 
cd ../engine
ant build
 
cd ../


