@echo off

CALL paths.bat
CALL vars.bat

VBoxManage sharedfolder add %VM_NAME% --name unique-shared-folder-name --hostpath ./sharedfolder --automount --auto-mount-point=/home/ubuntu/sharedfolder/
REM --readonly
REM --transient