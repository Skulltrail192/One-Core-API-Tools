@echo off

ECHO                            PHASE: Cleaning ISO Output folder

ECHO Cleanning Output ISO folder

REM ECHO %letter%
del /q %~dp0Output\ISO\*

ECHO Done!

timeout 3 > NUL