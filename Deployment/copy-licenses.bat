@echo off

cls

ECHO                              PHASE: Copying Licenses

if "%setenv%" == "" (
	call setenv.bat
)

rd /s /q %~dp0Sources\DVD\sources\license
rd /s /q %~dp0Boot\Setup\sources\license
	
XCOPY res\ei.cfg "%~dp0Sources\DVD\sources" /Y /F

XCOPY res\license "%~dp0Sources\DVD\sources\license" /E /H /C /I /Y	

if exist "%~dp0Boot\Setup\sources" (	
	XCOPY res\ei.cfg "%~dp0Boot\Setup\sources" /Y /F	
	XCOPY res\license "%~dp0Boot\Setup\sources\license" /E /H /C /I /Y	
)