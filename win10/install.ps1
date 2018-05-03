#Requires -RunAsAdministrator
[CmdletBinding()]
Param(
	[string][Parameter(Mandatory=$True)]$PowershellHomeLocation,
	[string]$MachineScriptsLocation
)

$env:Dotfiles = (Get-Item -Path "..\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

$env:Dotfiles_PowershellHome = $PowershellHomeLocation
[Environment]::SetEnvironmentVariable("Dotfiles_PowershellHome", $env:Dotfiles_PowershellHome, "User")

$env:Dotfiles_MachineScripts = $MachineScriptsLocation
[Environment]::SetEnvironmentVariable("Dotfiles_MachineScripts", $env:Dotfiles_MachineScripts, "User")

# Link ConEmu config
$DotfilesConEmuSettingsPath = Join-Path $env:Dotfiles "win10\conemu\ConEmu.xml"
$LinkConEmuSettingsPath = "$env:AppData\ConEmu.xml"
Remove-Item -Path $LinkConEmuSettingsPath
New-Item -Path $LinkConEmuSettingsPath -ItemType SymbolicLink -Value $DotfilesConEmuSettingsPath

# Link git config
$DotfilesGitconfigPath = Join-Path $env:Dotfiles "git\.gitconfig"
$LinkGitconfigPath = "$env:HOMEDRIVE$env:HOMEPATH\.gitconfig"
Remove-Item -Path $LinkGitconfigPath
New-Item -Path $LinkGitconfigPath -ItemType SymbolicLink -Value $DotfilesGitconfigPath