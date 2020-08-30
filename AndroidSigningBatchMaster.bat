@ECHO OFF 
:: This batch is Wasy way to sign an asndroid relase APK
TITLE Android APK signer
ECHO Please wait...
:: Section 1: 
ECHO ============================
ECHO Android APK signer
ECHO ============================
set KeyToolPath=C:\Program Files (x86)\Java\jre1.8.0_251\bin
set JavaPath=C:\Program Files\Java\jdk1.8.0_202\bin
@set /p KeyStoreName="Please type your app KeyStore name:"
ECHO ==== This path will used for KeyStore Location and Release APK location 
@set /p ReleaseAPKPath= "Please type your app Release path:" 
@set /p ReleaseAPKName= "Please type your app Release APK name:" 
@set /p SignedAPKName= "Please type your app Signed APK name:" 
ECHO ============================
ECHO Generating Key Store :
cd %KeyToolPath% 
::dir
keytool -genkey -v -keystore %ReleaseAPKPath%\%KeyStoreName%.keystore -alias %KeyStoreName% -keyalg RSA -keysize 2048 -validity 10000
keytool -genkey -v -keystore %ReleaseAPKPath%\%KeyStoreName%.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias %KeyStoreName%
::ECHO Keystore generated successfully.
ECHO ============================
ECHO Signing APK now ...
cd %ReleaseAPKName%
cd %JavaPath%
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %ReleaseAPKPath%\%KeyStoreName%.keystore %ReleaseAPKPath%\%ReleaseAPKName%.apk %KeyStoreName%
::ECHO App signing completed successfully.

ECHO ============================
ECHO E . N . J . O . Y :D
::@echo off
ECHO
PAUSE