@echo off

ECHO                 PHASE: Choose mount Boot WIM

ECHO The Windows PE Setup Image of Boot WIM is not mounted. Do you want mount to copy patched binaries?
ECHO.
ECHO 1.Yes
ECHO 2.No
ECHO.
		
set /p a=Type option:
IF %a%==1 (	
	call mount-boot-wim.bat
)