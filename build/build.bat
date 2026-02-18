set BUILD_HOME=.
set REPO_URL=http://svn/psg/Mizuho/branches/Release1
set USERNAME=psgdevopsuser
set PASSWORD=Gsource@987
set REPO_TYP=SVN
set RELEASE_BRANCH=Release1
set RELEASE_TAG=
set JAVA_HOME=C:\Program Files\RedHat\java-1.8.0-openjdk-1.8.0.412-1
set ANT_HOME=C:\GoldenSource\Workbench_8.8.1\eclipse\plugins\org.apache.ant_1.9.6.v201510161327
set PATH=%JAVA_HOME%\bin;%ANT_HOME%\bin;%PATH%


echo "Copying build.properties to respective directories"

cd %BUILD_HOME%


copy build.properties .\custom
copy build.properties .\templates
copy build.properties .\engine

echo "Check-out/clone code from Repository"
cd custom
echo "java -jar BuildPackage.jar $REPO_URL $USERNAME $PASSWORD SVN $RELEASE_BRANCH"
java -jar BuildPackage.jar %REPO_URL% %USERNAME% %PASSWORD% %REPO_TYP% %RELEASE_BRANCH% %RELEASE_TAG%

echo "**********************************************Creating DW Packages*******************************************"
copy .\DW\build.xml .\
copy .\DW\PackageDescription.xml .\
call ant build
del .\build.xml
del .\PackageDescription.xml
echo "**********************************************Creating GC Packages*******************************************"
copy .\GC\build.xml .\
copy .\GC\PackageDescription.xml .\
call ant build
del .\build.xml
del .\PackageDescription.xml
echo "**********************************************Creating VD Packages*******************************************"
copy .\VD\build.xml .\
copy .\VD\PackageDescription.xml .\
call ant build
del .\build.xml
del .\PackageDescription.xml
echo "**********************************************Creating Template Packages*******************************************"

cd ..\templates
copy ..\custom\UI\build.xml .\
call ant build

echo "**********************************************Creating Engine Packages*******************************************"

cd ..\engine
call ant build

cd ..\

echo "Deleting tmpRepo Directory if present"
rmdir /s /q tmpRepo

echo "Deleting Temporary files if present"
del .\custom\build.xml
del .\custom\PackageDescription.xml
del .\custom\build.properties
del .\templates\build.properties
del .\templates\build.xml
del .\engine\build.properties
del .\custom\SCTL_Delete.sql

rmdir /s /q .\custom\UI
rmdir /s /q .\custom\DW
rmdir /s /q .\custom\VD
rmdir /s /q .\custom\GC

