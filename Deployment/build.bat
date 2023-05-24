@echo off

REM Admin Check
if exist "%WinDir%\servicing" (
	reg query "HKU\S-1-5-19\Environment" >nul
	if not "%ERRORLEVEL%" EQU "0" (

		echo.
		echo This tool must be launched with Administrator permissions!
		echo.
		
		echo  Press any key to exit...
		pause >nul
		goto :EOF

	)
)



 
REM REM ECHO %letter%
REM del /S %letter%:\Windows\inf\*.pnf
REM cd /d %~dp0
REM CLS

REM Set Env Variables
call setenv.bat

REM Clean disk drive for pnf and log files
call clean.bat

REM capture image
call capture.bat

REM patch winsetup
call patch-bins.bat

REM capture image
call iso.bat

REM REM :End
REM "dism\imagex.exe" /capture /flags "professional" %letter%: "DiskFiles\%ARCH%\%engine%\sources\install.wim" "Windows XP x64"


REM if exist "%letter%:\Windows\SysWOW64" (
	REM set ARCH=amd64
REM ) else (
	REM set ARCH=x86
REM )

REM if exist "DiskFiles\%ARCH%\%engine%\efi\microsoft\boot\efisys.bin" (
	REM "Oscdimg\%ARCH%\oscdimg.exe" -l"Windows XP" -m -oc -u2 -udfver102 -bootdata:2#p0,e,b"DiskFiles\%ARCH%\%engine%\boot\etfsboot.com"#pEF,e,b"DiskFiles\%ARCH%\%engine%\efi\microsoft\boot\efisys.bin" "DiskFiles\%ARCH%\%engine%" "Output\ISO\%TARGETISO%_WIM.iso"
REM ) else (
	REM "Oscdimg\%ARCH%\oscdimg.exe" -l"Windows XP" -m -oc -u2 -udfver102 -b"DiskFiles\%ARCH%\%engine%\boot\etfsboot.com" "DiskFiles\%ARCH%\%engine%" "Output\ISO\%TARGETISO%_WIM.iso"
REM )

REM title A better way
REM color 0a
REM echo.
REM echo 1.restart
REM echo 2.shutdown
REM echo 3.close all windows
REM echo 4.log off
REM echo 5.switch user
REM echo.


REM echo %a%

REM PAUSE

