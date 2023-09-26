@echo off

CALL paths.bat
CALL vars.bat

if [%1] == [] (
    ECHO "Please select a vm by index"
    exit /b 1  
)
if [%2] == [] (
    ECHO "Please specify an interface number"
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET vmIndex=%1

REM -- Beginning of main script

FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vm=%%i
if not [%vm%] == [] ( 
    ECHO VM: %vm%
    ECHO Nic Nr: %2
    VBoxManage modifyvm %vm% --nic%2 none
) else ( 
    ECHO "virtual machine for index '%1' not found." 
)

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName