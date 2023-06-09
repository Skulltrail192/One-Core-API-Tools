@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

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