@echo off

CALL paths.bat
CALL vars.bat

if "%1" == "" (
    ECHO "Src path is missing."
    exit /b 1  
)

if "%2" == "" (
    ECHO "Dst path is missing."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET mediumNameSrc=%1
SET mediumNameDst=%2

VBoxManage modifymedium "%DISC_PATH%/%mediumNameSrc%.vdi" --move "%DISC_PATH%/%mediumNameDst%.vdi"