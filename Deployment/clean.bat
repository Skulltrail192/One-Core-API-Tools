@echo off

if "%engine%" == "" (
	call setenv.bat
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