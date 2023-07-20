@echo off

cls

ECHO                           PHASE: Copying image to Sources

if not exist "%~dp0Output\WIM\install.wim" (
	ECHO Not copying Install.wim is not presente on Output\WIM!
	goto :EOF
)	

ECHO Copying install.wim to Windows DVD source folder

if exist "%~dp0Sources\DVD\sources\install.esd" (
	del "%~dp0Sources\DVD\sources\install.esd"
)

if exist "%~dp0Output\WIM\install.wim" (
	XCOPY %~dp0Output\WIM\install.wim "%~dp0Sources\DVD\sources" /Y /F
)	

ECHO Done!

timeout 3 > NUL