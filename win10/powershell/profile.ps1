# Register custom scripts
Set-Alias -Name "gt" -Value "$env:Dotfiles\win10\powershell\scripts\git-tree.ps1"
Set-Alias -Name "lpass" -Value "$env:Dotfiles\win10\powershell\scripts\lpass.ps1"

# Z
Import-Module z
Set-Alias z Search-NavigationHistory

# Prompt
Function Prompt () {
	$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
	$admin = If ($isAdmin) { "[Admin]" } Else { "" };
	return "$admin> "
}

# Default folder
$CurrentLocation = Get-Location
if($CurrentLocation.Path -eq "$env:HOMEDRIVE$env:HOMEPATH")
{
	Set-Location $env:PSHOME
}