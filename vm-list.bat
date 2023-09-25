@echo off
setlocal EnableDelayedExpansion

CALL paths.bat

REM https://stackoverflow.com/questions/18866089/reading-a-text-file-line-by-line-and-storing-it-in-an-array-using-batch-script
for /F "delims=" %%a in ('VBoxManage list vms') do (
    set /A countVms+=1
    set vms[!countVms!]=%%a
)
for /L %%i in (1,1,%countVms%) do (
    echo %%i. !vms[%%i]!
)