@echo off

CALL paths.bat

REM https://superuser.com/questions/429432/how-can-i-configure-a-dhcp-server-assigned-to-a-host-only-net-in-virtualbox#429442

VBoxManage hostonlyif create