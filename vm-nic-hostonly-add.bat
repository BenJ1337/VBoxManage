@echo off

CALL paths.bat
CALL vars.bat


REM -- Check for mandatory arguments --
if [%1] == [] (
    ECHO "Nr for vm is missing."
    exit /b 1  
)
if [%2] == [] (
    ECHO "Nr for interface is missing."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET vmIndex=%1
SET interfaceIndex=%2

REM -- Beginning of main script

CALL :getVmName %vmIndex% || exit /b 1
CALL :getInterfaceName %interfaceIndex% || exit /b 1

REM TODO Make index of adapter an option. currently its hardcoded
VBoxManage modifyvm "%vmName%" --nic2 hostonly --host-only-adapter2="%interfaceName%"

exit /b 0 REM End of main script

REM -- Methods --

:getVmName <vmIndex>
    FOR /F "tokens=*" %%i IN ('vm-getName.bat %1') DO SET vmName=%%i
    if ["%vmName%"] == [""] (
        ECHO "virtual machine for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getVmName

:getInterfaceName <interfaceIndex>
    FOR /F "tokens=*" %%i IN ('net-hostonly-list %1 Name') DO SET interfaceName=%%i
    if ["%interfaceName%"] == [""] (
        ECHO "interface for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getInterfaceName
