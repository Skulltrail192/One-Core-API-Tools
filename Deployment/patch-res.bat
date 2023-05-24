@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)

ECHO Please choose if you want patch setup binaries with XP/2003 setup style:
ECHO.
ECHO 1.Patch binaries
ECHO 2.Not patch binaries
ECHO.

set /p a=
IF %a%==1 (
	cls	

if exist "%~dp0BootWIM\sources" (

	if "%installationType%" == "client" (
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\w32uiimg.dll" -save "Sources\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\xp\w32uiimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\spwizimg.dll" -save "Sources\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\xp\spwizimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\setup.exe" -save "Sources\sources\setup.exe" -action addoverwrite -resource "%~dp0res\xp\setup.res" , , ,
			XCOPY res\xp\background_cli.bmp "%~dp0Sources\sources" /Y /F
			XCOPY res\xp\winpe.bmp "%~dp0BootWIM\Windows\System32" /Y /F
	)
	if "%installationType%" == "server" (
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\w32uiimg.dll" -save "Sources\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\srv\w32uiimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\spwizimg.dll" -save "Sources\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\srv\spwizimg.res" , , ,
			"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\sources\setup.exe" -save "Sources\sources\setup.exe" -action addoverwrite -resource "%~dp0res\srv\setup.res" , , ,
			XCOPY res\server\background_cli.bmp "%~dp0Sources\sources" /Y /F
			XCOPY res\server\winpe.bmp "%~dp0BootWIM\Windows\System32" /Y /F
	)
	
	XCOPY Sources\sources\w32uiimg.dll "%~dp0BootWIM\sources" /Y /F
	
	XCOPY Sources\sources\spwizimg.dll "%~dp0BootWIM\sources" /Y /F	
	
	XCOPY Sources\sources\setup.exe "%~dp0BootWIM\sources" /Y /F
	)
)