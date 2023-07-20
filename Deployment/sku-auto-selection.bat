@echo off

cls

	ECHO                                PHASE: Autodetection of SKU	
	
	if "%letter%" == "" (
		cls
		call set-drive-letter.bat
		ECHO                                PHASE: Autodetection of SKU			
	)
	

	if not exist "%letter%:\Program Files" (
		ECHO The drive is not mounted or not a Windows/Reactos compatible installation
		pause >nul	
		goto :EOF
	)

	if exist "%letter%:\Windows\SysWOW64" (
		set GUESTARCH=x64
	) else (
		set GUESTARCH=x86
	)
	
	if exist "%letter%:\Windows\Professional.xml" (
		if %GUESTARCH% == x86 (
			SET TARGETISO=WXPFPP_EN			
			SET Description=Windows XP Professional Edition
		)		
		if %GUESTARCH% == x64 (			
			SET TARGETISO=AX2PXFPP_EN
			SET Description=Windows XP Professional x64 Edition
		)	
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
	if exist "%letter%:\Windows\FLP.xml" (
		SET TARGETISO=WIN51FLP
		SET Description=Windows XP FLP Edition
		SET flags=Professional
		SET installationType=client		
	)
	if exist "%letter%:\Windows\ServerEnterprise.xml" (
		SET TARGETISO=WIN2K3FREE
		SET flags=ServerEnterprise
		if %GUESTARCH% == x86 (
			SET Description=Windows Server 2003 Enterprise Edition
		)		
		if %GUESTARCH% == x64 (
			SET Description=Windows Server 2003 Enterprise x64 Edition
		)
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerDataCenter.xml" (
		SET TARGETISO=WXPFPP_EN
		SET Description=Windows Server 2003 Datacenter Edition
		if %GUESTARCH% == x86 (
			SET Description=Windows Server 2003 Datacenter Edition
		)		
		if %GUESTARCH% == x64 (
			SET Description=Windows Server 2003 Datacenter x64 Edition
		)		
		SET flags=ServerDataCenter
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerStandard.xml" (
		SET TARGETISO=WXPFPP_EN
		if %GUESTARCH% == x86 (
			SET Description=Windows Server 2003 Standanrd Edition
		)		
		if %GUESTARCH% == x64 (
			SET Description=Windows Server 2003 Standanrd x64 Edition
		)	
		SET flags=ServerStandard
		SET installationType=server		
	)
	if exist "%letter%:\Windows\ServerWeb.xml" (
		SET TARGETISO=WXPFPP_EN
		if %GUESTARCH% == x86 (
			SET Description=Windows Server 2003 Web Edition
		)		
		if %GUESTARCH% == x64 (
			SET Description=Windows Server 2003 Web Edition x64 Edition
		)			
		SET flags=ServerWeb
		SET installationType=server		
	)
	
	if "%flags%" == "" (
		SET TARGETISO=Windows
		SET Description=Windows OS Image
		SET flags=Windows Foundation
		SET installationType=client
	)