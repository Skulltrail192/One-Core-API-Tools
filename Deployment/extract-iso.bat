@echo off

if "%setenv%" == "" (
	call setenv.bat
)

call clean-dvd.bat

cls

ECHO                          PHASE: Extracting Base ISO

"%~dp0tools\7z\%ARCH%\7z.exe" x "%~dp0Input\ISO\*.iso" -o"%~dp0\Sources\DVD" -y

ECHO Done!

timeout 3 > NUL