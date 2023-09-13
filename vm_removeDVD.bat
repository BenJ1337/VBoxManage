@echo off

CALL paths.bat
CALL vars.bat

VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" ^
    --port 0 --device 0 --medium "none" 