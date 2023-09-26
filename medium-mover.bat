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

VBoxManage modifymedium "%array[general][MEDIUM_PATH]%/%mediumNameSrc%.vdi" --move "%array[general][MEDIUM_PATH]%/%mediumNameDst%.vdi"