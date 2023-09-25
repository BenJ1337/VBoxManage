@echo off
setlocal EnableDelayedExpansion

CALL paths.bat

for /F "delims=" %%a in ('CALL vm-list.bat') do (
    set /A countVmsToStart+=1
    set vms[!countVmsToStart!]=%%a
)

for /L %%i in (1,1,%countVmsToStart%) do (
    set /A countVmProps=1
    for %%a in (!vms[%%i]!) do (
        set vm[!countVmProps!]=%%a
        set /A countVmProps+=1
    )
    if "%1." == "!vm[1]!" (
        ECHO !vm[2]!
        exit /b 0
    )
)
exit /b 1