@echo off
cls
Title Creating Moving Pictures Installer

IF "%programfiles(x86)%XXX"=="XXX" GOTO 32BIT
    :: 64-bit
    SET PROGS=%programfiles(x86)%
    GOTO CONT
:32BIT
    SET PROGS=%ProgramFiles%
:CONT

IF NOT EXIST "%PROGS%\Team MediaPortal\MediaPortal\" SET PROGS=C:

:: Get version from DLL
FOR /F "tokens=*" %%i IN ('..\Tools\Tools\sigcheck.exe /accepteula /nobanner /n "..\MovingPictures\bin\Release\MovingPictures.dll"') DO (SET version=%%i)

:: Temp xmp2 file
COPY ..\Setup\MovingPictures-Native.xmp2 ..\Setup\MovingPicturesTemp.xmp2

:: Build MPE1
CD ..\Setup
"%PROGS%\Team MediaPortal\MediaPortal\MPEMaker.exe" ..\Setup\MovingPicturesTemp.xmp2 /B /V=%version% /UpdateXML
CD ..\build

:: Cleanup
del ..\Setup\MovingPicturesTemp.xmp2
