@echo off

cls

ECHO                            PHASE: Select Drive to copy content

ECHO Please give your drive letter what you want copy sources content and press ENTER:
ECHO.

set /p driveLetter=Type driver letter:

if not exist "%driveLetter%:\Sources" (
	ECHO You choose a invalid drive sources. Run Command again and choose a valid drive with Windows DVD content:
	goto :EOF
)

cls

call clean-dvd.bat

cls

ECHO                            PHASE: Copying Drive Sources Content

xcopy %driveLetter%:\*.* "%~dp0Sources\DVD" /h /i /c /k /e /r /y

attrib -r %~dp0Sources\DVD\*.* /s