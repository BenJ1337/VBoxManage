@echo off

CALL paths.bat
CALL vars.bat

VBoxManage startvm %VM_NAME%