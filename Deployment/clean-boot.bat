@echo off

ECHO Cleanning Windows DVD source folder

REM ECHO %letter%
cd %~dp0Boot

for %%i in (*.*) do if not "%%i"=="Readme.txt" del /q "%%i"

cd %~dp0

ECHO Done!

timeout 3 > NUL