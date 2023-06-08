@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if not exist "%~dp0Boot\sources" (
	cls	
	call choose-mount-boot-wim.bat	
	cls
)

call patch-bins.bat
	
if exist "%~dp0Boot\sources" (
	cls	
	call choose-unmount-boot-wim.bat	
	cls
	ECHO                 PHASE: Patch Binaries to deploy XP/2003

	ECHO Done!	
)	