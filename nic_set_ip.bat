@echo off

CALL paths.bat
CALL vars.bat

VBoxManage hostonlyif ipconfig %HOST_ONLY% --ip 10.0.0.1
