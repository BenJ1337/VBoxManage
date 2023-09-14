@echo off

CALL paths.bat
CALL vars.bat

VBoxManage modifyvm %VM_NAME% --nic2 none