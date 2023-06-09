@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%installationType%" == "" (
	call sku-selection-method.bat
	cls
)


ECHO                   PHASE: Patch Resources to deploy XP/2003

ECHO Please choose if you want patch setup binaries with XP/2003 setup style:
ECHO.
ECHO 1.Patch binaries
ECHO 2.Not patch binaries
ECHO.

set /p a=Type option:
IF %a%==1 (
	cls	
	
	call patch-res.bat
	
	ECHO Done!
	timeout 2 > NUL
)