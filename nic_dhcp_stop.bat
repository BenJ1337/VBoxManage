@echo off

CALL paths.bat
CALL vars.bat

VBoxManage dhcpserver stop --ifname %HOST_ONLY%