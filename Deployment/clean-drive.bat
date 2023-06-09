@echo off

cls

ECHO                                PHASE: Clean Drive

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

if not exist "%letter%:\Program Files" (
	ECHO The drive is not mounted or not a Windows/Reactos compatible installation
	set isMounted="true"
	pause 	
	goto :EOF
)

ECHO Cleanning some files from drive

REM ECHO %letter%
for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.pnf*"') do (
	del /q /s /a "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.log*" ^| findstr /v /c:"\assembly\"') do (
	del /q /s /a "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.old*"') do (
	del /q /s /a "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.bak*"') do (
	del /q /s /a "%%A" >nul 2>nul
)