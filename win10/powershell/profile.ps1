# Register custom scripts
Get-ChildItem "$env:Dotfiles\win10\powershell\scripts" -Filter *.ps1 | 
Foreach-Object {
	Set-Alias -Name $_.BaseName -Value $_.FullName
}
Get-ChildItem "$env:Home\scripts" -Filter *.ps1 | 
Foreach-Object {
	Set-Alias -Name $_.BaseName -Value $_.FullName
}

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
if($CurrentLocation.Path -eq $env:Home)
{
	Set-Location $env:PSHOME
}