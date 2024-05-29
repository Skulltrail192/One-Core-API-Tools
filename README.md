# One-Core-API-Tools

This repository contains tools for One-Core-API, Windows XP and Server 2003 Deployment and on future, other tools.

Restrictions:
- You must install Windows Xp/2003/Longhorn on a Hypervisor, like Vmware (recommended), VirtualBox or Qemu;
- If you use VirtualBox 4 and 5.x to install Windows, you must enable APIC mode on VirtualBoX VM config (processor section) to turn possible install One-Core-API Modern Setup package;
- For now, the deployment tool is dependent of One-Core-API Modern Setup package. If you don't install these package on Windows Installation, the setup will fail;
- Is recommend install One-Core-API Driver Update too, to support AHCI, NVME and USB 3.0 (USBXHCI) and can be installed on several computers;
- You must mount the virtual hard disk what Windows was installed, to capture and generalize it and the mount mode must be writeable. OSFMount, Winmount or DaemonTools are recommendeds to mount virtual Hard disks.
- After use deployment tool, the VM will be install again all drivers, and maybe you need install VM tools too again;
- If you dont't run sysprep included on One-Core-API Modern Setup package before capture the Windows Installation, Windows will don't enter on Hardware detection phase on setup;
- Windows Vista or above setup by default can't install Windows XP/2003 without error, because begin on Vista the language setup was modified. So, you must patch setup before generate a iso with Windows XP/2003 Setup;
- You need use a Windows Vista/7/8/8.1/10 iso to procced install. You can copy the iso to Deployment/Input/ISO. After copy, you must need use extract-iso.bat to extract all needed content to iso. You can too use a Deployment\copy-content-drive.bat to copy content from a monted iso or cd/dvd inserted on drive. In all cases the content will be copied to Deployment\Sources\DVD. You can copy manually the content from a iso ou dvd to Deployment\Sources\DVD.
