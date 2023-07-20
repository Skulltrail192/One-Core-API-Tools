@echo off

cls

mode con: lines=50

	set a=
	set TARGETISO=
	set Description=
	set flags=
	set installationType="	
	
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
	ECHO 13.Windows XP Embedded
	ECHO 14.Windows Longhorn Professional Edition
	ECHO 15.Windows Longhorn Server Edition
	ECHO 16.Windows Vista Beta 1
	ECHO 17.Windows Vista Starter
	ECHO 18.Windows Vista Business
	ECHO 19.Windows Vista Home Basic
	ECHO 20.Windows Vista Home Premium
	ECHO 21.Windows Vista Enterprise
	ECHO 22.Windows Vista Ultimate
	ECHO 23.Windows 7 Starter
	ECHO 24.Windows 7 Professional
	ECHO 25.Windows 7 Home Basic
	ECHO 26.Windows 7 Home Premium
	ECHO 27.Windows 7 Enterprise
	ECHO 28.Windows 7 Ultimate	
	ECHO 29.Windows 8	
	ECHO 30.Windows 8 Core	
	ECHO 31.Windows 8 Pro	
	ECHO 32.Windows 8 Pro With Media Center
	ECHO 33.Windows 10 Home
	ECHO 34.Windows 10 Pro
	ECHO 35.Windows 10 Pro Education
	ECHO 36.Windows 10 Pro for Workstations
	ECHO 37.Windows 10 Enterprise
	ECHO 38.Windows 10 LTSC
	ECHO 39.Windows 11
	ECHO 40.Reactos
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
	IF %a%==13 (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows XP Embedded
		SET flags=ServerWeb
		SET installationType=client
	)	
	IF %a%==14 (
		SET TARGETISO=LB1PFRE_EN
		SET Description=Windows Longhorn Professional
		SET flags=Professional
		SET installationType=client
	)
	IF %a%==15 (
		SET TARGETISO=LMBFRE_EN
		SET Description=Windows Longhorn Server
		SET flags=ServerEnterprise
		SET installationType=server
	)
	
	IF %a%==16 (
		SET TARGETISO=LB1PFRE_EN
		SET Description=Windows Longhorn Professional
		SET flags=0
		SET installationType=client
	)	

	if %flags% == "" (
		SET TARGETISO=Windows
		SET Description=Windows OS Image
		SET flags=Windows Foundation
		SET installationType=client
	)

mode con: lines=25