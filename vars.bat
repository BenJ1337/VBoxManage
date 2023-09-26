REM -- Beginning of main script --

call :loadVarsFromIni env.ini
ECHO %array[general][MEDIUM_PATH]%

exit /b 0 REM End of main script

REM -- Methods --
    :loadVarsFromIni <filename>
    for /f "usebackq delims=" %%a in ("%~1") do (
        set ln=%%a
        if "x !ln:~0,1!"=="x [" (
            set currarea=!ln:~1,-1!
        ) else (
            for /f "tokens=1,2 delims==" %%b in ("!ln!") do (
                set currkey=%%b
                set currval=%%c
                set array[!currarea!][!currkey!]=!currval!
            )
        )
    )
    exit /b 0