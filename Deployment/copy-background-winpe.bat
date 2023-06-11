@echo off

cls

ECHO             PHASE: Copying patched resources to Boot WIM

if exist "%~dp0Boot\PE\sources" (
	if %installationType% == client (
		if exist "%~dp0Boot\PE\sources" (
			XCOPY res\client\winpe.bmp "%~dp0Boot\PE\Windows\System32" /Y /F
		)
	)
	if %installationType% == server (
		if exist "%~dp0Boot\PE\sources" (
			XCOPY res\server\winpe.bmp "%~dp0Boot\PE\Windows\System32" /Y /F
		)
	)
    
)