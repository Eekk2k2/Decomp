@echo off

:: xapks act differently
set isxapk=5
if exist %~dp0\.input\%1.xapk set isxapk=true
echo %isxapk%

if exist %~dp0\.input (
    set apk_name = "Wrong"
    ::Argument one is root dir, second is project name
    for /f "delims=" %%i in ('python %~dp0ac-get-xapk-name.py %1 %2') do set apk_name=%%i
    echo Attempt at apk name : %apk_name%
)



::call "%~dp0tools\apktool\apktool.bat" -v d %~dp0.decompiled\%1\unknown\%apk_name%.apk -o %~dp0.decompiled\%1\unknown\%apk_name% -f
::call "%~dp0tools\apktool\apktool.bat" -v d "%~dp0.input\%1.apk" -o "%~dp0.decompiled\%1" -f
::call "C:\Program Files\Java\jdk1.8.0_261\bin\keytool.exe" -genkey -v -keystore %~dp0.keys\%1.keystore -alias %1-alias -keyalg RSA -keysize 2048 -
