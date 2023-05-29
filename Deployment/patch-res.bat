@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%installationType%" == "" (
	call sku-selection-method.bat
)

cls

ECHO                 PHASE: Patch Resources to deploy XP/2003

ECHO Please choose if you want patch setup binaries with XP/2003 setup style:
ECHO.
ECHO 1.Patch binaries
ECHO 2.Not patch binaries
ECHO.

if not exist "%~dp0Boot\sources" (
	ECHO Warning: you not mounted Boot WIM, no changes to Windows PE Setup Image, only main sources.
)

set /p a=
IF %a%==1 (
	cls	
	
	ECHO Patching binaries with XP/2003 resources..
	
	ECHO "%installationType%"

	if "%installationType%" == "client" (
		REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver
		REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\xp\setup.res" , , ,
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\client\spwizimg.res" , , ,			
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\client\w32uiimg.res" , , ,			
		XCOPY res\client\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
		if exist "%~dp0Boot\sources" (
			XCOPY res\client\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\client\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\client\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
	)
	if "%installationType%" == "server" (
		REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver	
		REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\srv\setup.res" , , ,	
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\server\spwizimg.res" , , ,
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\server\w32uiimg.res" , , ,
		XCOPY res\server\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F				
		if exist "%~dp0Boot\sources" (
			XCOPY res\server\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\server\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\server\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
	)
		
	if exist "%~dp0Boot\sources" (
		
		XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\sources" /Y /F
			
		XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\sources" /Y /F	
			
		XCOPY Sources\DVD\sources\setup.exe "%~dp0Boot\sources" /Y /F
	)
	
	ECHO Done!
)




