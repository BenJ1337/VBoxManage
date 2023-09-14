@echo off

CALL paths.bat
CALL vars.bat

VBoxManage sharedfolder remove %VM_NAME% --name unique-shared-folder-name 
REM --transient