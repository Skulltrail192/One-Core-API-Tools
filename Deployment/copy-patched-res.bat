@echo off

cls

ECHO              PHASE: Copying patched resources to Boot WIM

if %installationType% == client (
	XCOPY res\client\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F
)
if %installationType% == server (
	XCOPY res\server\background_cli.bmp "%~dp0Sources\DVD\sources" /Y /F    
	REM Always skip product key
	echo [sku]>"%~dp0Sources\DVD\sources\product.ini"
	echo Type=Server>>"%~dp0Sources\DVD\sources\product.ini"    
)

if exist "%~dp0Boot\Setup\sources" (
    "%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\Setup\sources\arunimg.dll" /A >nul
    "%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\Setup\sources\arunimg.dll" /grant *S-1-5-32-544:F >nul	
    if not exist "Boot\Setup\sources\arunimg1.dll" (
    	ren "Boot\Setup\sources\arunimg.dll" arunimg1.dll	
    	XCOPY Sources\DVD\sources\arunimg.dll "%~dp0Boot\Setup\sources" /Y /F	
    )	
    
    if exist "Boot\Setup\sources\arunimg1.dll" (
    	XCOPY Sources\DVD\sources\arunimg.dll "%~dp0Boot\Setup\sources" /Y /F	
    )    	
    
    "%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\Setup\sources\spwizimg.dll" /A >nul
    "%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\Setup\sources\spwizimg.dll" /grant *S-1-5-32-544:F >nul	
    if not exist "Boot\Setup\sources\spwizimg1.dll" (
    	ren "Boot\Setup\sources\spwizimg.dll" spwizimg1.dll	
    	XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\Setup\sources" /Y /F    
    )	
    
    if exist "Boot\Setup\sources\spwizimg1.dll" (
    	XCOPY Sources\DVD\sources\spwizimg.dll "%~dp0Boot\Setup\sources" /Y /F    
    )    	

    "%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\Setup\sources\w32uiimg.dll" /A >nul
    "%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\Setup\sources\w32uiimg.dll" /grant *S-1-5-32-544:F >nul	
    if not exist "Boot\Setup\sources\w32uiimg1.dll" (
    	ren "Boot\Setup\sources\w32uiimg.dll" w32uiimg1.dll	
    	XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\Setup\sources" /Y /F	
    )	
    	
    if exist "Boot\Setup\sources\w32uiimg1.dll" (
    	XCOPY Sources\DVD\sources\w32uiimg.dll "%~dp0Boot\Setup\sources" /Y /F	
    )  

	if %installationType% == client (
		XCOPY res\client\background.bmp "%~dp0Boot\Setup\sources" /Y /F
		XCOPY res\client\winpe.bmp "%~dp0Boot\Setup\Windows\System32" /Y /F
		XCOPY res\client\setup.bmp "%~dp0Boot\Setup\Windows\System32" /Y /F
	)
	if %installationType% == server (    
		XCOPY res\server\background.bmp "%~dp0Boot\Setup\sources" /Y /F
		XCOPY res\server\winpe.bmp "%~dp0Boot\Setup\Windows\System32" /Y /F
		XCOPY res\server\setup.bmp "%~dp0Boot\Setup\Windows\System32" /Y /F
		echo [sku]>"%~dp0Boot\Setup\sources\product.ini"
		echo Type=Server>>"%~dp0Boot\Setup\sources\product.ini"			
	)    
)