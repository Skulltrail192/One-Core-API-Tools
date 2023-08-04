@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

ECHO                     PHASE: Cleannig Hardware Infomation Drive

reg load HKLM\TempSytem "%letter%:\Windows\System32\config\system" >nul
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn setowner -ownr n:Administrators
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn setowner -ownr n:Administrators
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\subinacl\subinacl.exe" /keyreg HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum /grant=Administrators

reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum /f

reg unload HKLM\TempSytem >nul	