@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)

ECHO Please choose if you want capure a new image or append to exiting image:
ECHO.
ECHO 1.Capture a new image
ECHO 2.Append to existing image
ECHO.

set /p a=
IF %a%==1 (
	"tools\dism\imagex.exe" /capture /flags "%flags%" %letter%: "%diskfiles%\install.wim" "%Description%" "%Description%"
	"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%diskfiles%\install.wim" --compress=LZX:100
)
IF %a%==2 (
	"tools\dism\imagex.exe" /append /flags "%flags%" %letter%: "%diskfiles%\install.wim" "%Description%" "%Description%"
)