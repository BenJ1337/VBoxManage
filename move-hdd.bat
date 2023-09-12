@echo off

CALL paths.bat
CALL vars.bat

VBoxManage modifymedium %DISC_PATH_OLD% --move %DISC_PATH%