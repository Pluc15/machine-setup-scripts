#Requires -RunAsAdministrator

$env:Dotfiles = (Get-Item -Path ".\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

# Choco
Set-ExecutionPolicy AllSigned; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install `
fzf `
git `
git.install `
gitextensions `
paint.net `
greenshot `
nodejs-lts `
dotnetcore-sdk `
poshgit

# Link ConEmu config
$DotfilesConEmuSettingsPath = Join-Path $env:Dotfiles "win10\conemu\ConEmu.xml"
$LinkConEmuSettingsPath = "$env:AppData\ConEmu.xml"
Remove-Item -Path $LinkConEmuSettingsPath
New-Item -Path $LinkConEmuSettingsPath -ItemType SymbolicLink -Value $DotfilesConEmuSettingsPath

# Link git config
$DotfilesGitconfigPath = Join-Path $env:Dotfiles "git\.gitconfig"
$LinkGitconfigPath = "$env:Home\.gitconfig"
Remove-Item -Path $LinkGitconfigPath
New-Item -Path $LinkGitconfigPath -ItemType SymbolicLink -Value $DotfilesGitconfigPath