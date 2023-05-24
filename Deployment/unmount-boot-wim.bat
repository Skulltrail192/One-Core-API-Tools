@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)

if exist "Sources\sources\boot.wim" (
	REM Unmount and commit changes Windows PE Setup Image  	
	%~dp0tools\dism\ImageX /unmount /commit BootWIM
)