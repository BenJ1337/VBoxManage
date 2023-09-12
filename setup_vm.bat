@echo off

CALL paths.bat
CALL vars.bat

VBoxManage createvm --name %VM_NAME% --ostype Linux_64 --register
VBoxManage modifyvm %VM_NAME% --cpus 4 --memory 4096 --vram 12

VBoxManage storagectl %VM_NAME% --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach %VM_NAME% --storagectl "SATA Controller" ^
    --port 0 --device 0 --type hdd ^
    --medium %DISC_PATH%

VBoxManage storagectl %VM_NAME% --name "IDE Controller" --add ide
VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" ^
    --port 0 --device 0 --type dvddrive ^
    --medium %ISO_PATH%