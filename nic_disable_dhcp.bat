@echo off

CALL paths.bat
CALL vars.bat

VBoxManage hostonlyif ipconfig %HOST_ONLY% --dhcp off