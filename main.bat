@echo off
chcp 1252

:next-command

setlocal EnableDelayedExpansion

set /P operation="Enter command: "
if "!operation!" == "exit" goto end

for %%a in (!operation!) do (
    set /A countOptInput+=1
    set ops[!countOptInput!]=%%a
)

REM ECHO %count%
for /L %%a in (1,1,%countOptInput%) do (
  if %%a == 1 (
    set s=!ops[%%a]!.bat
  ) else (
    set s=!s! !ops[%%a]!
  )
)

ECHO --
CALL !s!
ECHO --


endlocal
goto next-command

:end
ECHO "Programm beendet."
