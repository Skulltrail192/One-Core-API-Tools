@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)


if exist "Sources\DVD\sources\boot.wim" (


	REM Call Choose patch binaries
	call choose-patch-bins.bat	
	
	REM Call Choose patch resources
	call choose-patch-res.bat		

	REM Mount Boot WIM
	call mount-boot-wim.bat		
	
	REM Choose copy licenses
	call choose-copy-licenses	
	
	REM Copy patched binaries
	call copy-patched-bins.bat	

	REM Copy patched resources
	call copy-patched-res.bat		
	
	REM Unmount Boot WIM
	call unmount-boot-wim.bat
	
	REM Mount PE WIM
	call mount-pe-wim.bat		

	REM Copy background of WinPE
	call copy-background-winpe.bat	

	REM Unount PE WIM
	call unmount-pe-wim.bat	
	
	REM Compress Boot WIM
	call compress-boot-image
)