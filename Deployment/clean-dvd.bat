@echo off

cls

ECHO                            PHASE: Cleanning DVD folder

ECHO Cleanning Windows DVD source folder

REM ECHO %letter%
cd %~dp0Sources\DVD\

for %%i in (*.*) do if not "%%i"=="Readme.txt" del /f /q "%%i"

for /d %%x in (*.*) do rmdir /s /q "%%x"

del /q /f "efi\microsoft"

cd %~dp0

ECHO Done!

timeout 3 > NUL