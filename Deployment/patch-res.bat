@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                     PHASE: Patch Resources to deploy XP/2003

ECHO Please choose if you want patch setup binaries with XP/2003 setup style:
ECHO.
ECHO 1.Patch binaries
ECHO 2.Not patch binaries
ECHO.

set /p a=
IF %a%==1 (
	cls	

if exist "%~dp0Boot\sources" (

	if "%installationType%" == "client" (
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\xp\w32uiimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\xp\spwizimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\xp\setup.res" , , ,
			XCOPY res\xp\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
			XCOPY res\xp\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\xp\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
	)
	if "%installationType%" == "server" (
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\srv\w32uiimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\srv\spwizimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\srv\setup.res" , , ,
			XCOPY res\server\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
			XCOPY res\server\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\server\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
	)
	
	XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\sources" /Y /F
	
	XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\sources" /Y /F	
	
	XCOPY Sources\DVD\sources\setup.exe "%~dp0Boot\sources" /Y /F
	)
)