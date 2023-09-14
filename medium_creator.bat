@echo off

CALL paths.bat
CALL vars.bat

VBoxManage createhd --filename %DISC_PATH% --size 10240 