@echo off

REM Admin Check
if exist "%WinDir%\servicing" (
	reg query "HKU\S-1-5-19\Environment" >nul
	if not "%ERRORLEVEL%" EQU "0" (

		echo.
		echo This tool must be launched with Administrator permissions!
		echo.
		
		echo  Press any key to exit...
		pause >nul
		goto :EOF

	)
)

cls

if not exist "Sources\DVD\sources\boot.wim" (
	ECHO You must need place Windows DVD contents on "Sources\DVD\sources"
	exit
)

REM Set Env Variables if not setted before
if "%setenv%" == "" (
	call setenv.bat
)

REM Clean disk drive for pnf and log files
call clean.bat

REM capture image
call capture.bat

REM patch winsetup
call convert-sources-xp-style.bat

REM create iso
call iso.bat

