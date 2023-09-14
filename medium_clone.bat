@echo off

CALL paths.bat
CALL vars.bat

VBoxManage clonemedium %DISC_PATH% ./hdd/new.vdi