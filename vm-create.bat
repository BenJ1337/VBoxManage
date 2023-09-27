@echo off

CALL paths.bat
CALL vars.bat


if [%1] == [] (
    ECHO "Please choose a name for the new vm."
    exit /b 1  
)
REM ubuntu-server-22-04-1.vdi
if [%2] == [] (
    ECHO "Please specify the size of the os medium."
    exit /b 1  
)

VBoxManage createvm --name %1 --ostype Linux_64 --register ^
    --basefolder "%array[general][VM_PATH]%\"
VBoxManage modifyvm %1 --cpus 4 --memory 4096 --vram 12

CALL medium-create %1\%1 %2

VBoxManage storagectl %1 --name "SATA Controller" --add sata --bootable on
VBoxManage storageattach %1 --storagectl "SATA Controller" ^
    --port 0 --device 0 --type hdd ^
    --medium "%array[general][VM_PATH]%\%1\%1.vdi"

:end
exit /b 0