@echo off

cd /D %~dp0

cls

TITLE Windows Build New Setup Environment


if not exist "Sources\DVD\sources\boot.wim" (
	ECHO                               PHASE: Begin Build
	ECHO You must need place Windows DVD contents on "Sources\DVD\sources"
	pause
	call choose-action-dvd-folder-empty.bat
)

REM Set Env Variables if not setted before
if "%setenv%" == "" (
	call setenv.bat
)

REM Select drive-letter
call set-drive-letter.bat

REM Clean disk drive for pnf and log files
call prepare-drive.bat

REM Choose method to select sku
call sku-selection-method.bat

REM capture image
call choose-capture-image.bat

REM create iso
call make-iso.bat

cls

ECHO                               PHASE: Finished Build

ECHO Finished on %DATE% at %TIME%