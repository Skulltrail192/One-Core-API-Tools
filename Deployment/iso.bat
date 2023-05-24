@echo off

if "%engine%" == "" (
	call setenv.bat
)

REM if exist "DiskFiles\%ARCH%\%engine%\efi\microsoft\boot\efisys.bin" (
	REM "Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -bootdata:2#p0,e,b"DiskFiles\%ARCH%\%engine%\boot\etfsboot.com"#pEF,e,b"DiskFiles\%ARCH%\%engine%\efi\microsoft\boot\efisys.bin" "DiskFiles\%ARCH%\%engine%" "Output\ISO\%TARGETISO%_WIM.iso"
REM ) else (
	REM "Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -b"DiskFiles\%ARCH%\%engine%\boot\etfsboot.com" "DiskFiles\%ARCH%\%engine%" "Output\ISO\%TARGETISO%_WIM.iso"
REM )

if exist "Sources\efi\microsoft\boot\efisys.bin" (
	"tools\Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -bootdata:2#p0,e,b"Sources\boot\etfsboot.com"#pEF,e,b"Sources\efi\microsoft\boot\efisys.bin" "Sources" "Output\ISO\%TARGETISO%_WIM.iso"
) else (
	"tools\Oscdimg\%ARCH%\oscdimg.exe" -l"%TARGETISO%" -m -oc -u2 -udfver102 -b"Sources\boot\etfsboot.com" "Sources%" "Output\ISO\%TARGETISO%_WIM.iso"
)

pause