@echo off

cls

if not exist "%~dp0Output\WIM\install.wim" (
	ECHO Install.wim is not presente on Output\WIM! Capture Image first.
	pause
)	

cls

ECHO                           PHASE: Compressing Windows image	
"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%~dp0Output\WIM\install.wim" --compress=LZX:100

call copy-WIM.bat
