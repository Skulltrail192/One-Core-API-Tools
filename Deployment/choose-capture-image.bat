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

ECHO                             PHASE: Capture or Append

if not exist "%letter%:\Program Files" (
	ECHO The drive is not mounted or not a Windows/Reactos compatible installation
	pause		
	cls
	call copy-WIM.bat
	goto :EOF
)


ECHO Please choose if you want capure a new image or append to exiting image:
ECHO.
ECHO 1.Capture a new image
ECHO 2.Append to existing image
ECHO 3.Do nothing
ECHO.


set /p a=Type option:
IF %a%==1 (	
	call capture-image.bat
	goto :EOF	
)
IF %a%==2 (
	call append-image.bat
	goto :EOF
)
IF %a%==3 (
	cls
	goto :Terminate
)

:Terminate
call copy-WIM.bat
