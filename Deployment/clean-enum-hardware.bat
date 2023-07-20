@echo off

cls

REM ECHO                               PHASE: Cleannig Drive

REM if "%setenv%" == "" (
	REM call setenv.bat
REM )

REM if "%letter%" == "" (
	REM call set-drive-letter.bat
REM )

REM cls

REM if not exist "%letter%:\Program Files" (
	REM cls
	REM ECHO                                PHASE: Clean Drive
	REM ECHO The drive is not mounted or not a Windows/Reactos compatible installation
	REM pause 	
	REM goto :EOF
REM )

cls

ECHO                               PHASE: Cleannig Drive

reg load HKLM\TempSytem "%~dp0Temp\SYSTEM" >nul
"%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn setowner -ownr n:Administrators
"%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn setowner -ownr n:Administrators
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\subinacl\subinacl.exe" /keyreg HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum /grant=Administrators

REM reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum /f
REM reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum /f

reg unload HKLM\TempSytem >nul	

pause