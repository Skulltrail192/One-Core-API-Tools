@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

ECHO                               PHASE: Preparing Drive

REM Clean disk drive for pnf and log files
call clean-drive.bat

call clean-enum-hardware.bat 

REM Set Inf of Windows Drive Unhide like Server 2003+ Windows
attrib -H /S /D /L %letter%:\Windows\inf