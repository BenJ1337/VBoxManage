@echo off

CALL paths.bat
CALL vars.bat

VBoxManage list dhcpservers

REM VBoxManage dhcpserver findlease --ifname %HOST_ONLY% <mac>