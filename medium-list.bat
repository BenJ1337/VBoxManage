@echo off
setlocal EnableDelayedExpansion

CALL paths.bat

REM -- transfers batch file arguments to variables with meaningful names --
SET indexMedium=%1

REM -- Beginning of main script --

CALL :getMediums || exit /b 1
CALL :getInfoOfMedium "%indexMedium%" "%indexAdapter%" || exit /b 1

exit /b 0 REM End of main script

REM -- Methods --

REM Interates through every line (Key: Value) and separates it in separate variables for key and value
:getMediums
    for /F "tokens=1,* delims=:" %%a in ('VBoxManage list hdds') do (
    
        SET value=%%b
        SET key=%%a
        REM Remove Postfix ":"
        SET key=!key::=!

        REM Removes Leading spaces
        for /f "tokens=* delims= " %%x in ("!value!") do set "value=%%x"
        REM "UUID" should be the first line per medium and we count the index up for every medium
        if "!key!" == "UUID" (
            SET /A indexAdapter+=1
        ) 
        SET mediums[!indexAdapter!][!key!]=!value!
    )
    exit /B 0 REM End of getMediums

:getInfoOfMedium <_indexMedium> <_numberOfMediums>
    SET _indexMedium=
    if not [%1] == [""] (
     SET /A _indexMedium=%1
    )
    SET _numberOfMediums=
    if not [%2] == [] (
        SET /A _numberOfMediums=%2
    )
    SET f="set mediums["
    if not [!_indexMedium!] == [] (
        SET isNum=
        for /F "delims=0123456789" %%y in ("!_indexMedium!") do set isNum=%%y
        if "%isNum%" == "" (
            REM %selectedInt% leads to an error because it expands the variable at parse time and if it isnt set it cant be compare to number of mediums
            if !_indexMedium! gtr %_numberOfMediums% set TRUE=1
            if !_indexMedium! lss 1 set TRUE=1
            if defined TRUE (
                    ECHO "There is no medium for your index: !_indexMedium!. There are %_numberOfMediums% mediums."
                    exit /B 1
            ) 
            SET f=%f%!_indexMedium!][
        )
    )
    for /F "tokens=1 delims==" %%k in ('!f!') do (
        echo "%%k >> !%%k!"
    ) 
    exit /B 0 REM End of getInfoOfMedium