@echo off

if not exist "%letter%:\Program Files" (
	ECHO The drive is not monted or not a Windows/Reactos compatible installation
	set isMounted="true"
	pause >nul	
)