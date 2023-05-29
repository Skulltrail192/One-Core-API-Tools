@echo off

cls

ECHO                            PHASE: Copying image to Sources

ECHO Copying install.wim to Windows DVD source folder

del "%~dp0Sources\DVD\sources\install.esd"

if exist "%~dp0Output\WIM\install.wim" (
	XCOPY %~dp0Output\WIM\install.wim "%~dp0Sources\DVD\sources" /Y /F
)	

ECHO Done!

timeout 3 > NUL