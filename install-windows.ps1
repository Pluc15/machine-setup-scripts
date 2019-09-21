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
$env:Dotfiles = Resolve-Path "$PSScriptRoot"
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

SymlinkConfig "configs\.gitconfig" "$env:USERPROFILE\.gitconfig"
SymlinkConfig "configs\.config\Code - OSS\User\settings.json" "$env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
SymlinkConfig "windows\terminal\profiles.json" "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState\profiles.json"

# Install Powershell profile
Write-Output "Invoke-Expression `". `$env:Dotfiles\windows\powershell\profile.ps1`"" > $PROFILE
