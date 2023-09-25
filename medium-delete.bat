@echo off
chcp 1252

CALL paths.bat
CALL vars.bat

REM -- Check for mandatory arguments --
if [%1] == [] (
    ECHO "filename of medium for deletion is missing."
    exit /b 1  
)

REM -- transfers batch file arguments to variables with meaningful names --
SET mediumPath=%1
SET mediumPath=%mediumPath:"=%

if not %mediumPath:~1,1% == : (
    SET mediumPath=%DISC_PATH%%mediumPath%
)


if not %mediumPath:~-4% == .vdi (
    SET mediumPath=%mediumPath%.vdi
)
ECHO Delete the medium under the following path: %mediumPath%

:loop
set deleteMedium=
set /P deleteMedium="Should the medium be deleted (Y/n): "
EcHO %deleteMedium%
if not [%deleteMedium%] == [] (
    if "%deleteMedium%" == "n" (
        ECHO Deletion abborted. File was not deleted.
        exit /b 0
    )
    if "%deleteMedium%" == "Y" set TRUE=1
    if "%deleteMedium%" == "y" set TRUE=1
    if defined TRUE (
        goto delete
    )

    ECHO Please Enter Y or n or leave the prompt empty for Y...
    goto loop
) 

:delete
VBoxManage closemedium "%mediumPath%" --delete

exit /b 0