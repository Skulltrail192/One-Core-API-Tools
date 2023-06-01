@echo off

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

if "%flags%" == "" (
	call sku-selection-method.bat
)

cls

ECHO                             PHASE: Capture or Append

if not exist "%letter%:\Program Files" (
	ECHO The drive is not monted or not a Windows/Reactos compatible installation
	pause		
	cls
	call copy-WIM.bat
	goto :EOF
)


ECHO Please choose if you want capure a new image or append to exiting image:
ECHO.
ECHO 1.Capture a new image
ECHO 2.Append to existing image
ECHO 3.Do nothing
ECHO.


set /p a=Type option:
IF %a%==1 (	
	ECHO                                PHASE: Capturing image
	"tools\ImageX\x86\imagex.exe" /capture /flags "%flags%" %letter%: "%~dp0Output\WIM\install.wim" "%Description%" "%Description%"
)
IF %a%==2 (
ECHO Option 1
	ECHO                                PHASE: Appending image
	"tools\ImageX\x86\imagex.exe" /append /flags "%flags%" %letter%: "%~dp0Output\WIM\install.wim" "%Description%" "%Description%"
)

cls

ECHO                            PHASE: Compressing Boot image	
"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%~dp0Output\WIM\install.wim" --compress=LZX:100

cls

call copy-WIM.bat
