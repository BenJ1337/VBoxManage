# https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-hostonlyif.html

@echo off

CALL paths.bat
CALL vars.bat

VBoxManage hostonlyif remove %HOST_ONLY%