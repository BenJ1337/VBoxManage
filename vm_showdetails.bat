@echo off

CALL paths.bat
CALL vars.bat

VBoxManage showvminfo %VM_NAME%