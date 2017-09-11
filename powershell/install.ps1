#Requires -RunAsAdministrator
$env:Dotfiles = (Get-Item -Path ".\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

# Link vscode configs
$DotfilesVsCodeSettingsPath = Join-Path $env:Dotfiles "cross\vscode\settings.json"
$LinkVsCodeSettingsPath = "$env:AppData\Code\User\settings.json"
Remove-Item -Path $LinkVsCodeSettingsPath
New-Item -Path $LinkVsCodeSettingsPath -ItemType SymbolicLink -Value $DotfilesVsCodeSettingsPath

# Choco
Set-ExecutionPolicy AllSigned; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install fzf