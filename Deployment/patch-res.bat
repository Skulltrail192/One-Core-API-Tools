@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%installationType%" == "" (
	call sku-selection-method.bat
	cls
)


cls	
	
ECHO                     PHASE: Patch Resources to deploy XP/2003	
	
ECHO Patching binaries with XP/2003 resources..

if %installationType% == client (
    REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver
    REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\xp\setup.res" , , ,
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\arunimg.dll" -save "Sources\DVD\sources\arunimg.dll" -action addoverwrite -resource "%~dp0res\client\arunimg.res" , , ,    
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\client\spwizimg.res" , , ,    	
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\client\w32uiimg.res" , , ,    	
)
if %installationType% == server (
    REM comment for now patch icon of setup.exe because cause a crazy error with Windows 8 or above setup engine, related with not present driver	
    REM "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\setup.exe" -save "Sources\DVD\sources\setup.exe" -action addoverwrite -resource "%~dp0res\srv\setup.res" , , ,	
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\arunimg.dll" -save "Sources\DVD\sources\arunimg.dll" -action addoverwrite -resource "%~dp0res\server\arunimg.res" , , ,
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\spwizimg.dll" -save "Sources\DVD\sources\spwizimg.dll" -action addoverwrite -resource "%~dp0res\server\spwizimg.res" , , ,
    "%~dp0tools\ResHack\ResourceHacker.exe" -open "Sources\DVD\sources\w32uiimg.dll" -save "Sources\DVD\sources\w32uiimg.dll" -action addoverwrite -resource "%~dp0res\server\w32uiimg.res" , , ,
)