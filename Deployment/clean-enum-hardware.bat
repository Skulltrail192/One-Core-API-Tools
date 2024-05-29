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

reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ACPI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\BTH /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\HID /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\HTREE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\IDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ISAPNP /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\LEGACY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\PCI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\PCIIDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\Root\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\Root\COMPOSITE_BATTERY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\STORAGE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\SW /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\USB /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ACPI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\BTH /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\HID /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\HTREE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\IDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ISAPNP /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\LEGACY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\PCI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\PCIIDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\Root\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\Root\COMPOSITE_BATTERY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\STORAGE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\SW /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\USB /f

reg unload HKLM\TempSytem >nul	