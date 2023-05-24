@echo off

cls

if "%engine%" == "" (
	call setenv.bat
)


if exist "Sources\sources\boot.wim" (
	REM Patch binaries with resources
	call mount-boot-wim.bat	
	
	REM Patch binaries with resources
	call patch-bins.bat	
	
	REM Patch binaries with resources
	call patch-res.bat
	
	REM Patch binaries with resources
	call copy-licenses.bat	
	
	REM Patch binaries with resources
	call unmount-boot-wim.bat
)