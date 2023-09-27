@echo off

CALL paths.bat
CALL vars.bat

REM -- Check for mandatory arguments --
if [%1] == [] (
    ECHO "Nr for vm is missing."
    exit /b 1  
)
if [%2] == [] (
    ECHO "Name for the new vm (clone) is missing."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET vmIndex=%1
SET vmCloneName=%2

REM -- Beginning of main script
CALL :getVmName %vmIndex% || exit /b 1
ECHO VM: %vmName%

VBoxManage clonevm "%vmName%" --name="%vmCloneName%" --register ^
    --basefolder "%array[general][VM_PATH]%\"
REM --mode=all REM --options=keepallmacs --options=keepdisknames --options=keephwuuids
    

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName