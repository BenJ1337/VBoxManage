REM https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-hostonlyif.html
@echo off

CALL paths.bat
CALL vars.bat

if [%1] == [] (
    ECHO "Please select an interface."
    exit /b 1  
)
SET interfaceIndex=%1

REM -- Beginning of main script

CALL :getInterfaceName %interfaceIndex% || exit /b 1

ECHO "Interface: %interfaceName%"

VBoxManage hostonlyif remove "%interfaceName%"

exit /b 0 REM End of main script

REM -- Methods --

:getInterfaceName <interfaceIndex>
    FOR /F "tokens=*" %%i IN ('net-hostonly-list %1 Name') DO SET interfaceName=%%i
    if ["%interfaceName%"] == [""] (
        ECHO "interface for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getInterfaceName