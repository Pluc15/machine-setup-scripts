#Requires -RunAsAdministrator
$env:Dotfiles = (Get-Item -Path ".\" -Verbose).FullName
[Environment]::SetEnvironmentVariable("Dotfiles", $env:Dotfiles, "User")

# Link vscode configs
$DotfilesVsCodeSettingsPath = Join-Path $env:Dotfiles "vscode\settings.json"
$LinkVsCodeSettingsPath = "$env:AppData\Code\User\settings.json"
Remove-Item -Path $LinkVsCodeSettingsPath
New-Item -Path $LinkVsCodeSettingsPath -ItemType SymbolicLink -Value $DotfilesVsCodeSettingsPath
