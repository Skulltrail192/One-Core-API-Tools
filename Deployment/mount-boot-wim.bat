@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)

if exist "Sources\DVD\sources\boot.wim" (
	REM Mount Windows PE Setup Image  
	%~dp0tools\dism\ImageX /mountrw "Sources\DVD\sources\boot.wim" 2 %~dp0BootWIM
)