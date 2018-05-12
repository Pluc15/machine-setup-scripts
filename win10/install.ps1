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
$env:Dotfiles = (Get-Item -Path "$PSScriptRoot\.." -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

$env:Dotfiles_PowershellHome = $PowershellHomeLocation
[Environment]::SetEnvironmentVariable("Dotfiles_PowershellHome", $env:Dotfiles_PowershellHome, "User")

$env:Dotfiles_MachineScripts = $MachineScriptsLocation
[Environment]::SetEnvironmentVariable("Dotfiles_MachineScripts", $env:Dotfiles_MachineScripts, "User")


# Install and update dependencies
choco upgrade chocolatey
choco install `
	dotnet4.7.1 `
	dotnetcore-sdk `
	fzf `
	git.install `
	greenshot `
	hackfont `
	nodejs-lts `
	gimp `
	powershell `
	putty.install `
	visualstudiocode `
	conemu

# Link configs
Function SymlinkConfig($DotfilesRelativePath, $DestinationPath) {
	$DotfilesAbsolutePath = Join-Path $env:Dotfiles $DotfilesRelativePath
	Remove-Item -Path $DestinationPath
	New-Item -Path $DestinationPath -ItemType SymbolicLink -Value $DotfilesAbsolutePath
}
SymlinkConfig "win10\conemu\ConEmu.xml" "$env:AppData\ConEmu.xml"
SymlinkConfig "git\.gitconfig" "$env:HOMEDRIVE$env:HOMEPATH\.gitconfig"
