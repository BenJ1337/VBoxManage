@echo off

CALL paths.bat
CALL vars.bat

VBoxManage storagectl %VM_NAME% --name "IDE Controller" --add ide
VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" ^
    --port 0 --device 0 --type dvddrive ^
    --medium %ISO_PATH%