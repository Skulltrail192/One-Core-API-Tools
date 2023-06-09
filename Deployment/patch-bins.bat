@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

FOR /F "tokens=*" %%g IN ('tools\bincheck\bincheck.exe Sources\DVD\sources\winsetup.dll') do (SET binARCH=%%g)

if "%binARCH%" == "32" (	
	REM Patch bins 32 bits
	call patch-bins-32.bat
)
if "%binARCH%" == "64" (
	REM Patch bins 64 bits
	call patch-bins-64.bat
)