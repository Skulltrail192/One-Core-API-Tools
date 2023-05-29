@echo off

cls

	set "a="
	set "TARGETISO="
	set "Description="
	set "flags="
	set "installationType="	
	
	ECHO                                PHASE: Selection of SKU
	
	ECHO Please insert the option what describe the setup Windows Edition what you want use:
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
	
	set /p a=Type option:
	IF %a%==1 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows XP Professional Edition
		SET flags=Professional
		SET installationType=client
	)
	IF %a%==2 (
		ECHO Home
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
		SET TARGETISO=ARMSXFPP_EN
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
	
	REM ECHO %op%	
	ECHO %TARGETISO%
	ECHO %Description%
	ECHO %flags%
	ECHO %installationType%	
