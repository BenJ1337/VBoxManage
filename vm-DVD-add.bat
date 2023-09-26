@echo off

CALL paths.bat
CALL vars.bat

if [%1] == [] (
    ECHO "Please select a vm by index"
    exit /b 1  
)
if [%2] == [] (
    ECHO "Please name a iso file"
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET vmIndex=%1
SET isoName=%2

REM -- Beginning of main script

CALL :getVmName %vmIndex% || exit /b 1

VBoxManage storagectl %vmName% --name "IDE Controller" --add ide
VBoxManage storageattach %vmName% --storagectl "IDE Controller" ^
    --port 0 --device 0 --type dvddrive ^
    --medium "%array[general][ISO_PATH]%%isoName%"

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if [%vmName%] == [] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName