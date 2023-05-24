@echo off

call setdriveletter.bat

cls

ECHO Please insert the option what describe the setup engine what you want use:
ECHO.
ECHO 1.Windows Vista
ECHO 2.Windows 7
ECHO 3.Windows 10
ECHO.

set /p a=
IF %a%==1 SET engine=WinVista
IF %a%==2 SET engine=Win7
IF %a%==3 SET engine=Win10

cls

ECHO Do you want insert the SKU (Windows Edition) of your installation or prefer auto detect?:
ECHO.
ECHO 1.Choose the SKU
ECHO 2.Auto Detect SKU
ECHO.

set /p a=
IF %a%==1 (
	cls
	ECHO Please insert the option what describe the setup engine what you want use:
	ECHO.
	ECHO 1.Windows XP Professional Edition
	ECHO 2.Windows XP Home Edition
	ECHO 3.Windows XP Media Center Edition
	ECHO 4.Windows XP Tablet PC Edition
	ECHO 5.Windows XP Starter Edition
	ECHO 6.Windows XP POSReady 2009
	ECHO 7.Windows XP Professional x64 Edition
	ECHO 8.Windows XP FLP Edition
	ECHO 9.Windows Server 2003 Enterprise Edition
	ECHO 10.Windows Server 2003 DataCenter Edition
	ECHO 11.Windows Server 2003 Standanrd Edition
	ECHO 12.Windows Server Web Edition
	ECHO.
	
	set /p a=
	IF %a%==1 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows XP Professional Edition
		SET flags=Professional
		SET installationType=client
	)
	IF %a%==2 (
		SET TARGETISO=WXHFPP_EN
		SET Description=Windows XP Home Edition
		SET flags=Home
		SET installationType=client		
	)
	IF %a%==3 (
		SET TARGETISO=MRMPFPP_EN
		SET Description=Windows XP Media Center Edition
		SET flags=MediaCenter
		SET installationType=client		
	)
	IF %a%==4 (
		SET TARGETISO=en_winxp_tablet_
		SET Description=Windows XP Tablet PC Edition
		SET flags=TabletPC
		SET installationType=client		
	)
	IF %a%==5 (
		SET TARGETISO=V2ACOEM_EN
		SET Description=Windows XP Starter Edition
		SET flags=Starter
		SET installationType=client		
	)
	IF %a%==6 (
		SET TARGETISO=POSRDY
		SET Description=Windows XP POSReady 2009
		SET flags=Embedded
		SET installationType=client		
	)
	IF %a%==7 (
		SET TARGETISO=AX2PXFPP_EN
		SET Description=Windows XP Professional x64 Edition
		SET flags=Professional
		SET installationType=client		
	)
	IF %a%==8 (
		SET TARGETISO=WIN51FLP
		SET Description=Windows XP FLP Edition
		SET flags=Professional
		SET installationType=client		
	)
	IF %a%==9 (
		SET TARGETISO=WIN2K3FREE
		SET Description=Windows Server 2003 Enterprise Edition
		SET flags=ServerEnterprise
		SET installationType=server		
	)
	IF %a%==10 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server 2003 DataCenter Edition
		SET flags=ServerDataCenter
		SET installationType=server		
	)
	IF %a%==11 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server 2003 Standanrd Edition
		SET flags=ServerStandard
		SET installationType=server		
	)
	IF %a%==12 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server Web Edition
		SET flags=ServerWeb
		SET installationType=server		
	)	
)
IF %a%==2 (
	if exist "%letter%:\Windows\Professional.xml" (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows XP Professional Edition
		SET flags=Professional
		SET installationType=client		
	)
	if exist "%letter%:\Windows\Home.xml" (
		SET TARGETISO=WXHFPP_EN
		SET Description=Windows XP Home Edition
		SET flags=Home
		SET installationType=client		
	)
	if exist "%letter%:\Windows\MediaCenter.xml" (
		SET TARGETISO=MRMPFPP_EN
		SET Description=Windows XP Media Center Edition
		SET flags=MediaCenter
		SET installationType=client		
	)
	if exist "%letter%:\Windows\Tablet.xml" (
		SET TARGETISO=en_winxp_tablet_
		SET Description=Windows XP Tablet PC Edition
		SET flags=TabletPC
		SET installationType=client		
	)
	if exist "%letter%:\Windows\Starter.xml" (
		SET TARGETISO=V2ACOEM_EN
		SET Description=Windows XP Starter Edition
		SET flags=Starter
		SET installationType=client		
	)
	if exist "%letter%:\Windows\Embedded.xml" (
		SET TARGETISO=POSRDY
		SET Description=Windows XP POSReady 2009
		SET flags=Embedded
		SET installationType=client		
	)
	if exist "%letter%:\Windows\Professional.xml" (
		if exist "%letter%:\Windows\SysWOW64" (
			SET TARGETISO=AX2PXFPP_EN
			SET Description=Windows XP Professional x64 Edition
			SET flags=Professional
			SET installationType=client			
		)
	)
	if exist "%letter%:\Windows\FLP.xml" (
		SET TARGETISO=WIN51FLP
		SET Description=Windows XP FLP Edition
		SET flags=Professional
		SET installationType=client		
	)
	if exist "%letter%:\Windows\ServerEnterprise.xml" (
		SET TARGETISO=POSRDY
		SET Description=Windows Server 2003 Enterprise Edition
		SET flags=ServerEnterprise
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerDataCenter.xml" (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server 2003 DataCenter Edition
		SET flags=ServerDataCenter
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerStandard.xml" (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server 2003 Standanrd Edition
		SET flags=ServerStandard
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerWeb.xml" (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server Web Edition
		SET flags=ServerWeb
		SET installationType=server		
	)
)

cls

if exist "%letter%:\Windows\SysWOW64" (
	set ARCH=amd64
) else (
	set ARCH=x86
)

SET diskfiles=Sources

if not exist "%WinDir%\System32\drivers" (
	REM Install DISM WIM Filter driver on XP / 2003 host
	start /wait RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultInstall 132 %~dp0tools\wimfltr\%ARCH%\wimmount.inf >nul
)
