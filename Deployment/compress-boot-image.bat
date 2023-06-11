@echo off

cls

if not exist "%~dp0Output\WIM\install.wim" (
	ECHO Install.wim is not presente on Output\WIM! Capture Image first.
	pause
)	

cls

if exist "Sources\DVD\sources\boot.wim" (
	ECHO                          PHASE: Compressing Boot image	
	"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%~dp0Sources\DVD\sources\boot.wim" --compress=LZX:100	
)

