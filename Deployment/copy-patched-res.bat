@echo off

cls

ECHO             PHASE: Copying patched resources to Boot WIM

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

	if %installationType% == client (
		XCOPY res\client\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
		if exist "%~dp0Boot\sources" (
			XCOPY res\client\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\client\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\client\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
	)
	if %installationType% == server (
		XCOPY res\server\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F        
		if exist "%~dp0Boot\sources" (
			XCOPY res\server\background.bmp "%~dp0Boot\sources" /Y /F
			XCOPY res\server\winpe.bmp "%~dp0Boot\Windows\System32" /Y /F
			XCOPY res\server\setup.bmp "%~dp0Boot\Windows\System32" /Y /F
		)
	)
    
)