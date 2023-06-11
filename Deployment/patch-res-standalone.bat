@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if %installationType% == "" (
	call sku-selection-method.bat
	cls
)


if not exist "%~dp0Boot\Setup\sources" (
	cls	
	call choose-mount-boot-wim.bat	
	cls
)

call patch-res.bat
	
if exist "%~dp0Boot\Setup\sources" (
	cls	
	call choose-unmount-boot-wim.bat	
	cls
	ECHO                     PHASE: Patch Resources to deploy XP/2003

	ECHO Done!	
)	