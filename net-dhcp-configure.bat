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

VBoxManage dhcpserver remove --ifname "%interfaceName%"
VBoxManage dhcpserver add --ifname "%interfaceName%" --ip 10.0.0.2 --netmask 255.255.255.0 --lowerip 10.0.0.110 --upperip 10.0.0.200
VBoxManage dhcpserver modify --ifname "%interfaceName%" --enable

exit /b 0 REM End of main script

REM -- Methods --

:getInterfaceName <interfaceIndex>
    FOR /F "tokens=*" %%i IN ('net-hostonly-list %1 Name') DO SET interfaceName=%%i
    if ["%interfaceName%"] == [""] (
        ECHO "interface for index '%1' not found."
        exit /B 1
    )
    exit /B 0 REM End of getInterfaceName