@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO               	    PHASE: Patch Binaries to deploy XP/2003

ECHO Please choose if you want capure patch winsetup or it already did:
ECHO.
ECHO 1.Patch winsetup.dll
ECHO 2.Not patch winsetup.dll
ECHO.

set /p a=Type option:
IF %a%==1 (
	REM Call patch bins
	call patch-bins.bat
)