@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO               	  PHASE: Patch Binaries to deploy XP/2003

ECHO Please choose if you want capure patch winsetup or it already did:
ECHO.
ECHO 1.Patch winsetup.dll
ECHO 2.Not patch winsetup.dll
ECHO.

set /p a=Type option:
IF %a%==1 (
	REM Mount Windows PE Setup Image  
	REM %~dp0tools\dism\ImageX /mountrw "Sources\DVD\sources\boot.wim" 2 %~dp0BootWIM
	
	FOR /F "tokens=*" %%g IN ('tools\bincheck\bincheck.exe Sources\DVD\sources\winsetup.dll') do (SET binARCH=%%g)

	if "%binARCH%" == "32" (	
	
		REM Patch Winsetup from cd sources

		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Vista or Win7 32 bits Setup 
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x83\xEC\x44\x33\xC0\x56\x33\xF6/:8" -e "s/\x83\xEC\x44\x33\xC0\x56\x33\xF6/\x33\xF6\x8B\xC6\xC9\xC2\x08\x00/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll

		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win8 32 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x83\xE4\xF8\x83\xEC\x4C\x53\x33\xDB\x83\x3D/:11" -e "s/\x83\xE4\xF8\x83\xEC\x4C\x53\x33\xDB\x83\x3D/\x33\xF6\x8B\xC6\xC9\xC2\x08\x00\xDB\x83\x3D/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll
	
		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win8.1 32 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x83\xE4\xF8\x83\xEC\x44\x53\x33\xDB\x83\x3D\xE8/:12" -e "s/\x83\xE4\xF8\x83\xEC\x44\x53\x33\xDB\x83\x3D\xE8/\x33\xF6\x8B\xC6\xC9\xC2\x08\x00\xDB\x83\x3D\xE8/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"
	
		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll
		
		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win10(until version 1909) 32 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x83\xE4\xF8\x83\xEC\x3C\x53\x56\x57\x33\xFF\x83/:12" -e "s/\x83\xE4\xF8\x83\xEC\x3C\x53\x56\x57\x33\xFF\x83/\x33\xF6\x8B\xC6\xC9\xC2\x08\x00\x57\x33\xFF\x83/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll		
		
		
		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win10(20H2) 32 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x83\xE4\xF8\x83\xEC\x44\x53\x56\x57\x33\xFF\x83/:12" -e "s/\x83\xE4\xF8\x83\xEC\x44\x53\x56\x57\x33\xFF\x83/\x33\xF6\x8B\xC6\xC9\xC2\x08\x00\x57\x33\xFF\x83/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"
	
		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll
		
		goto :Terminate
	)
	if "%binARCH%" == "64" (
		REM REM Patch Winsetup from cd sources		
		
		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Vista or Win7 64 bits Setup 
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x81\xEC\xD0/:20" -e "s/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x81\xEC\xD0/\xC3\xC0\x33\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x81\xEC\xD0/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll

		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win8 and Win10 until 1709 64 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xD9\x48\x81\xEC\xD0/:25" -e "s/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xD9\x48\x81\xEC\xD0/\xC3\xC0\x33\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xD9\x48\x81\xEC\xD0/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll

		REM REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win10 1803 until 1909 64 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xF0\x48\x81\xEC\x10/:25" -e "s/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xF0\x48\x81\xEC\x10/\xC3\xC0\x33\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xF0\x48\x81\xEC\x10/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll

		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win10 2004 until 22H2 64 bits Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xE0\x48\x81\xEC\x20/:25" -e "s/\x48\x89\x4C\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xE0\x48\x81\xEC\x20/\xC3\xC0\x33\x24\x08\x55\x56\x57\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x6C\x24\xE0\x48\x81\xEC\x20/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"

		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll

		REM Patch WinSetup.dll on mounted image to allow install Windows XP/2003  - Try Win11 Setup
		"%~dp0tools\bbe\%ARCH%\bbe.exe" -b "/\x48\x89\x58\x10\x48\x89\x70\x18\x48\x89\x78\x20\x55\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x68\xA1\x48\x81\xEC\x00/:29" -e "s/\x48\x89\x58\x10\x48\x89\x70\x18\x48\x89\x78\x20\x55\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x68\xA1\x48\x81\xEC\x00/\xC3\xC0\x33\x10\x48\x89\x70\x18\x48\x89\x78\x20\x55\x41\x54\x41\x55\x41\x56\x41\x57\x48\x8D\x68\xA1\x48\x81\xEC\x00/"" "Sources\DVD\sources\winsetup.dll" -o "Sources\DVD\sources\winsetup1.dll"
	
		del "Sources\DVD\sources\winsetup.dll"

		ren "Sources\DVD\sources\winsetup1.dll" winsetup.dll	
		
		goto :Terminate
	)
	
	REM "%~dp0tools\PEChecksum\PE.exe" -c Sources\DVD\sources\winsetup.dll

:Terminate	
	if not exist "%~dp0Boot\sources" (
		cls
		
		ECHO               	  PHASE: Patch Binaries to deploy XP/2003		
		
		call choose-mount-boot-wim.bat			
	)

	if exist "%~dp0Boot\sources" (
		"%~dp0tools\takeown\%ARCH%\takeown.exe" /F "%~dp0Boot\sources\winsetup.dll" /A >nul
		"%~dp0tools\icacls\%ARCH%\icacls.exe" "%~dp0Boot\sources\winsetup.dll" /grant *S-1-5-32-544:F >nul	
		if not exist "Boot\sources\winsetup.bak" (
			REM Windows 10 1904 and above has issue causing BSOD if you try replace or delete system dlls directly, so, only rename
			ren "Boot\sources\winsetup.dll" winsetup.bak
			XCOPY /s Sources\DVD\sources\winsetup.dll "%~dp0Boot\sources" /Y /F	
		)
		
		if exist "Boot\sources\winsetup.bak" (
			REM Windows 10 1904 and above has issue causing BSOD if you try replace or delete system dlls directly, so, only rename
			XCOPY /s Sources\DVD\sources\winsetup.dll "%~dp0Boot\sources" /Y /F	
		)		
		
		reg load HKLM\TempSoftware "Boot\Windows\system32\config\SOFTWARE" >nul
		reg load HKLM\TEMPSYSTEM "Boot\Windows\system32\config\SYSTEM" >nul	
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
		
		pause
		
		cls
		
		ECHO               	  PHASE: Patch Binaries to deploy XP/2003		
		
		call choose-unmount-boot-wim.bat				
	)	

	goto :EOF
)