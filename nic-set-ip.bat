@echo off

CALL paths.bat

REM -- transfers batch file arguments to variables with meaningful names --
SET selectedInt=%1
SET ipAddress=%2

REM -- Beginning of main script --

CALL :getInterfaceName %selectedInt% || exit /b 1
VBoxManage hostonlyif ipconfig "%interfaceName%" --ip %ipAddress%

exit /b 0 REM End of main script

REM -- Methods --

:getInterfaceName <interfaceIndex>
FOR /F "tokens=*" %%i IN ('net-hostonly-list.bat %1 Name') DO SET interfaceName=%%i
if "%interfaceName%" == "" (
    ECHO "virtual machine for index '%1' not found."
    exit /B 1
)
exit /B 0 REM End of getInterfaceName