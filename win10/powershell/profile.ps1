# Posh-git - TODO Make path relative so it works on all machines
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-a4faccd\src\posh-git.psd1'

# Register custom scripts
Get-ChildItem "$env:Dotfiles\powershell\scripts" -Filter *.ps1 | 
Foreach-Object {
	Set-Alias -Name $_.BaseName -Value $_.FullName
}

# Z
Import-Module z
Set-Alias z Search-NavigationHistory


$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
$admin = If ($isAdmin) { "[Admin]" } Else { "" };
$GitPromptSettings.DefaultPromptPrefix = '$admin '
$GitPromptSettings.DefaultPromptSuffix = '`n$(''>'' * ($nestedPromptLevel + 1)) '
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true

# function Prompt {
# 	Update-NavigationHistory $pwd.Path
# 	$p = "";

# 	"$p $pwd>"
# }