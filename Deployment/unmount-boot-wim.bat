@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                     PHASE: UnMounting Boot WIM Image

if exist "Sources\DVD\sources\boot.wim" (
	REM Unmount and commit changes Windows PE Setup Image  	
	"%~dp0tools\ImageX\%ARCH%\ImageX.exe" /unmount /commit Boot
	
	cls

	REM ECHO                                PHASE: Compressing image	
	REM "tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%~dp0Sources\DVD\sources\boot.wim" --compress=LZX:100	
)