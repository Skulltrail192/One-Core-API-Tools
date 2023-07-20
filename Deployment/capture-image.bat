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

ECHO                                PHASE: Capturing image

if not exist "%letter%:\Program Files" (
	ECHO The drive is not mounted or not a Windows/Reactos compatible installation
	pause		
	cls
	call copy-WIM.bat
	goto :EOF
)

cls

ECHO                                PHASE: Capturing image
"tools\ImageX\x86\imagex.exe" /capture /flags "%flags%" %letter%: "%~dp0Output\WIM\install.wim" "%Description%" "%Description% - %DATE% - %TIME%"

call compress-image.bat
