@echo off

cls

ECHO                               PHASE: Begin Build	
ECHO Please choose if you want capure a new image or append to exiting image:
ECHO.
ECHO 1.Copy DVD content from mounted ISO or DVD drive;
ECHO 2.Extract DVD content from ISO placed on Input/ISO folder
ECHO 3.Do nothing
ECHO.


set /p a=Type option:
IF %a%==1 (	
	call copy-content-drive.bat
	goto :EOF	
)
IF %a%==2 (
	call extract-iso.bat
	goto :EOF
)
IF %a%==3 (
	exit
)	
