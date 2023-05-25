@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)

ECHO Please choose if you want copy licenes to support Windows Xp/2003 SKUs or already did it:
ECHO.
ECHO 1.Copy licenses
ECHO 2.Not copy licenses
ECHO.

set /p a=
IF %a%==1 (
	cls
	
	XCOPY res\ei.cfg "%~dp0Sources\sources" /Y /F

	XCOPY res\license "%~dp0Sources\DVD\sources\license" /E /H /C /I /Y	

	if exist "%~dp0BootWIM\sources" (	
		XCOPY res\ei.cfg "%~dp0BootWIM\sources" /Y /F	
		XCOPY res\license "%~dp0BootWIM\sources\license" /E /H /C /I /Y	
	)
)