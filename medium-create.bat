@echo off

CALL paths.bat
CALL vars.bat

REM -- Check for mandatory arguments --
if "%1" == "" (
    ECHO "Path or filename is missing."
    exit /b 1  
)

if "%2" == "" (
    ECHO "Size for medium is missing."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET mediumName=%1
SET mediumSize=%2


REM -- Beginning of main script --

REM  --size= megabytes: Specifies the image capacity in one megabyte units.

VBoxManage createmedium --filename "%DISC_PATH%/%mediumName%" --size %mediumSize%


exit /b 0 REM End of main script