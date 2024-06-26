@echo off

if "%setenv%" == "" (
	call setenv.bat
)

cls

REM call clean-Output

cls

ECHO                                PHASE: Creating ISO

ECHO Creating ISO...Please wait!

if "%TARGETISO%" == "" (
	set TARGETISO=Windows
)

del /f "%~dp0Output\ISO\%TARGETISO%.iso"

if exist "%~dp0Sources\DVD\efi\microsoft\boot\efisys.bin" (
	"%~dp0tools\Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -bootdata:2#p0,e,b"%~dp0Sources\DVD\boot\etfsboot.com"#pEF,e,b"%~dp0Sources\DVD\efi\microsoft\boot\efisys.bin" "%~dp0Sources\DVD" "%~dp0Output\ISO\%TARGETISO%.iso"
) else (
	"%~dp0tools\Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -b"%~dp0Sources\DVD\boot\etfsboot.com" "%~dp0Sources\DVD" "%~dp0Output\ISO\%TARGETISO%.iso"
)

cls

ECHO                                PHASE: Created ISO

ECHO Done!

timeout 3 > NUL