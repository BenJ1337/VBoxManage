@echo off

CALL paths.bat
CALL vars.bat

if [%1] == [] (
    ECHO "Please select a vm by index"
    exit /b 1  
)

if [%2] == [] (
    ECHO "Please enter the name for the shared folder"
    exit /b 1  
)

if [%3] == [] (
    ECHO "Please enter the directory on the host"
    exit /b 1  
)

if [%4] == [] (
    ECHO "Please enter the directory on the guest"
    exit /b 1  
)

REM -- Beginning of main script

CALL :getVmName %vmIndex% || exit /b 1

VBoxManage sharedfolder add %vmName% --name %2 --hostpath %3 --automount --auto-mount-point=%4

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName