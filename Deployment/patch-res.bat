@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%installationType%" == "" (
	call sku-selection-method.bat
	cls
)

ECHO                 PHASE: Patch Resources to deploy XP/2003

ECHO Please choose if you want patch setup binaries with XP/2003 setup style:
ECHO.
ECHO 1.Patch binaries
ECHO 2.Not patch binaries
ECHO.

set /p a=Type option:
IF %a%==1 (
	cls	
	
	ECHO                 PHASE: Patch Resources to deploy XP/2003	
	
	ECHO Patching binaries with XP/2003 resources..

	if "%installationType%" == "client" (
		REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver
		REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\xp\setup.res" , , ,
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\arunimg.dll" -save "Sources\DVD\sources\arunimg.dll" -action addoverwrite -resource "%~dp0res\client\arunimg.res" , , ,		
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\client\spwizimg.res" , , ,			
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\client\w32uiimg.res" , , ,			
		XCOPY res\client\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
		if exist "%~dp0Boot\sources" (
			XCOPY res\client\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\client\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\client\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
		goto :Terminate
	)
	if "%installationType%" == "server" (
		REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver	
		REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\srv\setup.res" , , ,	
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\arunimg.dll" -save "Sources\DVD\sources\arunimg.dll" -action addoverwrite -resource "%~dp0res\server\arunimg.res" , , ,
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\server\spwizimg.res" , , ,
		"%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\server\w32uiimg.res" , , ,
		XCOPY res\server\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F				
		if exist "%~dp0Boot\sources" (
			XCOPY res\server\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\server\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\server\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
		goto :Terminate
	)
	
:Terminate	
	if exist "%~dp0Boot\sources" (
		"%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\sources\arunimg.dll" /A >nul
		"%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\sources\arunimg.dll" /grant *S-1-5-32-544:F >nul	
		if not exist "Boot\sources\arunimg1.dll" (
			ren "Boot\sources\arunimg.dll" arunimg1.dll	
			XCOPY Sources\DVD\sources\arunimg.dll "%~dp0Boot\sources" /Y /F	
		)	
		
		if exist "Boot\sources\arunimg1.dll" (
			XCOPY Sources\DVD\sources\arunimg.dll "%~dp0Boot\sources" /Y /F	
		)			
		
		"%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\sources\spwizimg.dll" /A >nul
		"%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\sources\spwizimg.dll" /grant *S-1-5-32-544:F >nul	
		if not exist "Boot\sources\spwizimg1.dll" (
			ren "Boot\sources\spwizimg.dll" spwizimg1.dll	
			XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\sources" /Y /F		
		)	
		
		if exist "Boot\sources\spwizimg1.dll" (
			XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\sources" /Y /F		
		)			

		"%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\sources\w32uiimg.dll" /A >nul
		"%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\sources\w32uiimg.dll" /grant *S-1-5-32-544:F >nul	
		if not exist "Boot\sources\w32uiimg1.dll" (
			ren "Boot\sources\w32uiimg.dll" w32uiimg1.dll	
			XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\sources" /Y /F	
		)	
			
		if exist "Boot\sources\w32uiimg1.dll" (
			XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\sources" /Y /F	
		)				
			
		REM XCOPY Sources\DVD\sources\setup.exe "%~dp0Boot\sources" /Y /F
		
	)	

	ECHO                 PHASE: Patch Resources to deploy XP/2003

	ECHO Done!
	goto :EOF
)