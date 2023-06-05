@echo off

cls

if exist "%~dp0Output\WIM\install.wim" (
	XCOPY %~dp0Output\WIM\install.wim "%~dp0Sources\DVD\sources" /Y /F
)	

ECHO                           PHASE: Selection method to choose SKU

ECHO Do you want insert the SKU (Windows Edition) of your installation or prefer auto detect?:
ECHO.
ECHO 1.Choose the SKU
ECHO 2.Auto Detect SKU (only work if has Windows Installation already mounted virtual disk)
ECHO.

set /p a=Type option:
IF %a%==1 (
	call sku-manual-selection.bat
	goto :EOF
)
IF %a%==2 (
	call sku-auto-selection.bat
	goto :EOF
)

