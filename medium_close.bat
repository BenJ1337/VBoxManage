@echo off

CALL paths.bat
CALL vars.bat

VBoxManage closemedium ./hdd/new.vdi --delete