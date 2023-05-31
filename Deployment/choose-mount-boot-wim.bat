@echo off

ECHO The Windows PE Setup Image of Boot WIM is not mounted. Do you want mount to copy patched winsetup.dll?
ECHO.
ECHO 1.Yes
ECHO 2.No
ECHO.
		
set /p a=Type option:
IF %a%==1 (	
	call mount-boot-wim.bat
)