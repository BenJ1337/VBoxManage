@echo off

CALL paths.bat
CALL vars.bat


if [%1] == [] (
    ECHO "Please select a vm by index"
    exit /b 1  
)

if [%2] == [] (
    ECHO "Please enter the name for the shared folder which you want to delete"
    exit /b 1  
)

REM -- Beginning of main script


CALL :getVmName %vmIndex% || exit /b 1

VBoxManage sharedfolder remove %vmName% --name %2 


exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName