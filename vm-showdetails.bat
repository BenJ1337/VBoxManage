@echo off

CALL paths.bat

REM -- Check for mandatory arguments --
if [%1] == [] (
    ECHO "Please select a virtual machine."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET vmIndex=%1

REM -- Beginning of main script --

CALL :getVmName %vmIndex% || exit /b 1
VBoxManage showvminfo %vmName%

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName
