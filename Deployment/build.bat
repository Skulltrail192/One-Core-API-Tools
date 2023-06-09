@echo off

cd %~dp0

cls

if not exist "Sources\DVD\sources\boot.wim" (
	ECHO You must need place Windows DVD contents on "Sources\DVD\sources"
	pause
	exit
)

REM Set Env Variables if not setted before
if "%setenv%" == "" (
	call setenv.bat
)

REM Select drive-letter
call set-drive-letter.bat

REM Clean disk drive for pnf and log files
call clean-drive.bat

REM Choose method to select sku
call sku-selection-method.bat

REM capture image
call capture.bat

REM patch winsetup
call convert-sources-xp-style.bat

REM create iso
call make-iso.bat

cls

ECHO                               PHASE: Finished Build

ECHO Finished on %DATE% at %TIME%