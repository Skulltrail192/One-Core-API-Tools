@echo off

cls

if exist "%WinDir%\SysWOW64" (
	set ARCH=x64
) else (
	set ARCH=x86
)

if not exist "%WinDir%\System32\drivers\wimfltr.sys" (
	REM Install DISM WIM Filter driver on XP / 2003 host
	start /wait RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultInstall 132 %~dp0tools\wimfltr\%ARCH%\wimmount.inf >nul
)

cls

SET diskfiles=Sources\DVD\sources

SET setenv=true
