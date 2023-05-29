@echo off

ECHO                                PHASE: Cleanning DVD folder

ECHO Cleanning Windows DVD source folder

REM ECHO %letter%
cd %~dp0Sources\DVD\

RMDIR /S /Q .

ECHO Done!

timeout 3 > NUL