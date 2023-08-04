@echo off

cls

ECHO                   PHASE: Copying patched WinSetup to Boot WIM

if exist "%~dp0Boot\Setup\sources" (
    "%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\Setup\sources\winsetup.dll" /A >nul
    "%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\Setup\sources\winsetup.dll" /grant *S-1-5-32-544:F >nul	
    if not exist "Boot\Setup\sources\winsetup.bak" (
    	REM Windows 10 1904 and above has issue causing BSOD if you try replace or delete system dlls directly, so, only rename
    	ren "Boot\Setup\sources\winsetup.dll" winsetup.bak
    	XCOPY /s Sources\DVD\sources\winsetup.dll "%~dp0Boot\Setup\sources" /Y /F	
    )
    
    if exist "Boot\Setup\sources\winsetup.bak" (
    	REM Windows 10 1904 and above has issue causing BSOD if you try replace or delete system dlls directly, so, only rename
    	XCOPY /s Sources\DVD\sources\winsetup.dll "%~dp0Boot\Setup\sources" /Y /F	
    )    
    
    reg load HKLM\TempSoftware "Boot\Setup\Windows\system32\config\SOFTWARE" >nul
    reg load HKLM\TEMPSYSTEM "Boot\Setup\Windows\system32\config\SYSTEM" >nul	
    REM ; Windows 11 Bypass config
    reg add "HKLM\TEMPSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\TEMPSOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d "1" /f >nul

    reg unload HKLM\TEMPSYSTEM >nul	
    reg unload HKLM\TempSoftware >nul	
)	