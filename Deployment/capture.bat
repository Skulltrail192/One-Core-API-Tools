@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                                PHASE: Capture

ECHO Please choose if you want capure a new image or append to exiting image:
ECHO.
ECHO 1.Capture a new image
ECHO 2.Append to existing image
ECHO.


set /p a=
IF %a%==1 (
ECHO                                PHASE: Capture
	"tools\ImageX\x86\imagex.exe" /capture /flags "%flags%" %letter%: "%diskfiles%\install.wim" "%Description%" "%Description%"
	"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%diskfiles%\install.wim" --compress=LZX:100
)
IF %a%==2 (
ECHO                                PHASE: Append
	"tools\ImageX\x86\imagex.exe" /append /flags "%flags%" %letter%: "%diskfiles%\install.wim" "%Description%" "%Description%"
)