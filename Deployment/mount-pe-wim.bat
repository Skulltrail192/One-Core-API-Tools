@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                       PHASE: Mounting Boot WIM Image

if exist "Sources\DVD\sources\boot.wim" (
	REM Mount Windows PE Setup Image  
	"%~dp0tools\ImageX\%ARCH%\ImageX.exe" /mountrw "Sources\DVD\sources\boot.wim" 1 %~dp0Boot\PE
)

timeout 3 > NUL