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

ECHO                                PHASE: Appending image
	"tools\ImageX\x86\imagex.exe" /append /flags "%flags%" %letter%: "%~dp0Output\WIM\install.wim" "%Description%" "%Description%"

call compress-image.bat
