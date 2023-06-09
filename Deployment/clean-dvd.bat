@echo off

ECHO                            PHASE: Cleanning DVD folder

ECHO Cleanning Windows DVD source folder

REM ECHO %letter%
cd %~dp0Sources\DVD\

for %%i in (*.*) do if not "%%i"=="Readme.txt" del /q "%%i"

for /d %%x in (*.*) do @rd /s /q "%%x"

cd %~dp0

ECHO Done!

timeout 3 > NUL