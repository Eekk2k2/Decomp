@echo off
setlocal EnableDelayedExpansion

echo Your project name %1

cls

echo Building...

::Build the project
if exist "%~dp0.input\%1.apk" (
    call "%~dp0tools\apktool\apktool.bat" -v b "%~dp0.decompiled\%1" -o "%~dp0.output\%1.apk" --use-aapt2 -f
) else if exist "%~dp0.input\%1.xapk" (
    ::xapk is two apks so we need to build the one inside first.
    call "%~dp0tools\apktool\apktool.bat" -v b "%~dp0.decompiled\%1\unknown\%1" -o "%~dp0.output\%1\unknown\%1.apk" --use-aapt2 -f

    ::Now we build the main thing
    call "%~dp0tools\apktool\apktool.bat" -v b "%~dp0.decompiled\%1" -o "%~dp0.output\%1.xapk" --use-aapt2 -f
)

echo Finished building...

cls

echo Signing...

::Signing the project || I do not know if we need to sign the apk inside the xapk
if exist "%~dp0.input\%1.apk" (
    call "C:\Program Files\Java\jdk1.8.0_261\bin\jarsigner.exe" -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore "%~dp0.keys\%1.keystore" "%~dp0.output\%1.apk" %1-alias
) else if exist "%~dp0.input\%1.xapk" (
    call "C:\Program Files\Java\jdk1.8.0_261\bin\jarsigner.exe" -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore "%~dp0.keys\%1.keystore" "%~dp0.output\%1.xapk" %1-alias
)

echo Finished signing... 

pause
cls