@echo off

cls

if "%noMountedDrive%" == "true" (
	goto :EOF
)

ECHO                           PHASE: Select Driver Letter

ECHO Please give your drive letter what you want capture and press ENTER:
ECHO.

set /p letter=Type driver letter:

if "%letter%" == "" (
	set noMountedDrive=true
)

cls
