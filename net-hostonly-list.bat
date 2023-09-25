@echo off
setlocal EnableDelayedExpansion

CALL paths.bat

if "%1" == "help" (
    ECHO "You can choose a specific interface by selecting its index as the first paramter"
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET selectedInt=%1
SET attributeName=%2

REM -- Beginning of main script --

CALL :getInterfaces || exit /b 1

if not "%attributeName%" == "" (
    CALL :getNameOfInterface %selectedInt% %indexAdapter% %attributeName% || exit /b 1
    exit /b 0
)
ECHO "Index:  %indexAdapter%"
CALL :getInfoOfInterface %selectedInt% %indexAdapter% || exit /b 1

exit /b 0 REM End of main script

REM -- Methods --

REM Interates through every line (Key: Value) and separates it in separate variables for key and value
:getInterfaces
    for /F "tokens=1,* delims=:" %%a in ('VBoxManage list hostonlyifs') do (
    
        SET value=%%b
        SET key=%%a
        REM Remove Postfix ":"
        SET key=!key::=!

        REM Removes Leading spaces
        for /f "tokens=* delims= " %%x in ("!value!") do set "value=%%x"
        REM "Name" should be the first line per interface and we count the index up for every interface
        if "!key!" == "Name" (
            SET /A indexAdapter+=1
        ) 
        SET interfaces[!indexAdapter!][!key!]=!value!
    )
    exit /B 0 REM End of getInterfaces

:getInfoOfInterface <indexInterface> <numberOfInterfaces>
    SET f="set interfaces["
    if not [%selectedInt%] == [] (
        SET isNum=
        for /F "delims=0123456789" %%y in ("%1") do set isNum=%%y
        if "%isNum%" == "" (
            REM %selectedInt% leads to an error because it expands the variable at parse time and if it isnt set it cant be compare to number of interfaces
            if %1 gtr %indexAdapter% set TRUE=1
            if %1 lss 1 set TRUE=1
            if defined TRUE (
                    ECHO "There is no interface for your index: %1. There are %2 interfaces."
                    exit /B 1
            ) 
            SET f=%f%%1][
        )
    )
    for /F "tokens=1 delims==" %%k in ('!f!') do (
        echo "%%k >> !%%k!"
    ) 
    exit /B 0 REM End of getInfoOfInterface

:getNameOfInterface <indexInterface> <numberOfInterfaces>
    SET f="set interfaces["
    if not [%1] == [] (
        SET isNum=
        for /F "delims=0123456789" %%y in ("%1") do set isNum=%%y
        if "%isNum%" == "" (
            REM %selectedInt% leads to an error because it expands the variable at parse time and if it isnt set it cant be compare to number of interfaces
            if %1 gtr %indexAdapter% set TRUE=1
            if %1 lss 1 set TRUE=1
            if defined TRUE (
                    ECHO "There is no interface for your index: %1. There are %2 interfaces."
                    exit /B 1
            ) 
            SET f=%f%%1][Name]
        )
    )
    for /F "tokens=1 delims==" %%k in ('!f!') do (
        echo !%%k!
    ) 
    exit /B 0 REM End of getInfoOfInterface