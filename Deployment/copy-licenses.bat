@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                                PHASE: Copy Licenses

ECHO Please choose if you want copy licenes to support Windows Xp/2003 SKUs or already did it:
ECHO.
ECHO 1.Copy licenses
ECHO 2.Not copy licenses
ECHO.

set /p a=
IF %a%==1 (
	cls
	
	XCOPY res\ei.cfg "%~dp0Sources\DVD\sources" /Y /F

	XCOPY res\license "%~dp0Sources\DVD\sources\license" /E /H /C /I /Y	

	if exist "%~dp0Boot\sources" (	
		XCOPY res\ei.cfg "%~dp0Boot\sources" /Y /F	
		XCOPY res\license "%~dp0Boot\sources\license" /E /H /C /I /Y	
	)
)