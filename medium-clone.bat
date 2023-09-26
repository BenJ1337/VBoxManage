@echo off

CALL paths.bat
CALL vars.bat

if "%1" == "" (
    ECHO "Src filepath/-name is missing."
    exit /b 1  
)

if "%2" == "" (
    ECHO "New filepath/-name is missing."
    exit /b 1  
)

VBoxManage clonemedium "%array[general][MEDIUM_PATH]%/%1" "%array[general][MEDIUM_PATH]%/%2"