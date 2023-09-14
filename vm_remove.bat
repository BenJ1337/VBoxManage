@echo off

CALL paths.bat
CALL vars.bat

REM VBoxManage modifyvm OracleLinux6Test --hda none 
REM other options
REM --hdb none
REM --hdd none

VBoxManage storageattach %VM_NAME% --storagectl "SATA Controller" ^
    --port 0 --device 0 --medium "none"
VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" ^
    --port 0 --device 0 --medium "none" 


VBoxManage unregistervm %VM_NAME% --delete