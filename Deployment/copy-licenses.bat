@echo off

cls

ECHO                                PHASE: Copy Licenses

if "%setenv%" == "" (
	call setenv.bat
)

if not exist "Sources\DVD\sources" (
	ECHO You must need place Windows DVD contents on "Sources\DVD\sources"
	pause
	goto :EOF
)

ECHO Please choose if you want copy licenes to support Windows Xp/2003 SKUs or already did it:
ECHO.
ECHO 1.Copy licenses (you need copy to turn able install Windows with Windows XP SKUs)
ECHO 2.Not copy licenses
ECHO.

set /p a=Type option:
IF %a%==1 (
	cls
	
	XCOPY res\ei.cfg "%~dp0Sources\DVD\sources" /Y /F

	XCOPY res\license "%~dp0Sources\DVD\sources\license" /E /H /C /I /Y	

	if exist "%~dp0Boot\sources" (	
		XCOPY res\ei.cfg "%~dp0Boot\sources" /Y /F	
		XCOPY res\license "%~dp0Boot\sources\license" /E /H /C /I /Y	
	)
)