@echo off

ECHO Do want you unmount Windows PE Setup Image of Boot WIM?
ECHO.
ECHO 1.Yes
ECHO 2.No
ECHO.
		
set /p a=Type option:
IF %a%==1 (	
	call unmount-boot-wim.bat
)