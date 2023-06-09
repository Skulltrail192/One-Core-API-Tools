@echo off

cls

ECHO                           PHASE: Copy Licenses

if "%setenv%" == "" (
	call setenv.bat
)

rd /s /q %~dp0Sources\DVD\sources\license
rd /s /q %~dp0Boot\sources\license
	
XCOPY res\ei.cfg "%~dp0Sources\DVD\sources" /Y /F

XCOPY res\license "%~dp0Sources\DVD\sources\license" /E /H /C /I /Y	

if exist "%~dp0Boot\sources" (	
	XCOPY res\ei.cfg "%~dp0Boot\sources" /Y /F	
	XCOPY res\license "%~dp0Boot\sources\license" /E /H /C /I /Y	
)