#Requires -RunAsAdministrator
[CmdletBinding()]
Param(
	[string]
	$PowershellHomeLocation,
	[string]
	$MachineScriptsLocation
)

$ErrorActionPreference = "Stop"

# Set environement variables
$env:Dotfiles = Resolve-Path "$PSScriptRoot\.."
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

$env:Dotfiles_PowershellHome = $PowershellHomeLocation
[Environment]::SetEnvironmentVariable("Dotfiles_PowershellHome", $env:Dotfiles_PowershellHome, "User")

$env:Dotfiles_MachineScripts = $MachineScriptsLocation
[Environment]::SetEnvironmentVariable("Dotfiles_MachineScripts", $env:Dotfiles_MachineScripts, "User")

# Link configs
Function SymlinkConfig($DotfilesRelativePath, $DestinationPath) {
	$DotfilesAbsolutePath = Join-Path $env:Dotfiles $DotfilesRelativePath
	If (Test-Path $DestinationPath) {
		Remove-Item -Path $DestinationPath
	}
	New-Item -Path $DestinationPath -ItemType SymbolicLink -Value $DotfilesAbsolutePath
}

SymlinkConfig "conemu\ConEmu.xml" "$env:AppData\ConEmu.xml"
SymlinkConfig "git\.gitconfig" "$env:HOMEDRIVE$env:HOMEPATH\.gitconfig"

# Install Powershell profile
Write-Output "Invoke-Expression `". `$env:Dotfiles\powershell\profile.ps1`"" > $PROFILE
