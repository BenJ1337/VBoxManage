@echo off

CALL paths.bat
CALL vars.bat

VBoxManage dhcpserver start --ifname %HOST_ONLY%