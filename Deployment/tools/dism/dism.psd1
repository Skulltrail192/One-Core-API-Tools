@{
    GUID = "{389c464d-8b8d-48e9-aafe-6d8a590d6798}"
    Author = "Microsoft Corporation"
    CompanyName = "Microsoft Corporation"
    Copyright = "© Microsoft Corporation. All rights reserved."
    HelpInfoUri = "http://go.microsoft.com/fwlink/?LinkId=212975"
    ModuleVersion = "1.0"
    PowerShellVersion = "3.0"
    ClrVersion = "4.0"
    RootModule = "Dism.psm1"
    NestedModules = "Microsoft.Dism.PowerShell.dll"
    TypesToProcess = "Dism.Types.ps1xml"
    FormatsToProcess = "Dism.Format.ps1xml"
    CmdletsToExport = @(
        'Add-AppxProvisionedPackage',
        'Add-WindowsDriver',
        'Add-WindowsPackage',
        'Clear-WindowsCorruptMountPoint',
        'Disable-WindowsOptionalFeature',
        'Dismount-WindowsImage',
        'Enable-WindowsOptionalFeature',
        'Get-AppxProvisionedPackage',
        'Get-WindowsDriver',
        'Get-WindowsEdition',
        'Get-WindowsImage',
        'Get-WindowsOptionalFeature',
        'Get-WindowsPackage',
        'Mount-WindowsImage',
        'Remove-AppxProvisionedPackage',
        'Remove-WindowsDriver',
        'Remove-WindowsPackage',
        'Repair-WindowsImage',
        'Save-WindowsImage',
        'Set-WindowsEdition',
        'Set-WindowsProductKey',
        'Use-WindowsUnattend'
    )
    AliasesToExport = @(
        'Apply-WindowsUnattend',
        'Add-ProvisionedAppxPackage',
        'Remove-ProvisionedAppxPackage',
        'Get-ProvisionedAppxPackage'
    )
}