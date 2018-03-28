#Requires -RunAsAdministrator
[CmdletBinding()]
Param(
	[string][Parameter(Mandatory=$True)]$DefaultPowershellLocation
)

$env:Dotfiles = (Get-Item -Path ".\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

$env:PSHOME = $DefaultPowershellLocation
[Environment]::SetEnvironmentVariable("PSHOME", $env:PSHOME, "User")

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