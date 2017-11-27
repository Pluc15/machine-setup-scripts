# Register custom scripts
Get-ChildItem "$env:Dotfiles\powershell\scripts" -Filter *.ps1 | 
Foreach-Object {
	Set-Alias -Name $_.BaseName -Value $_.FullName
}

# Z
Import-Module z
Set-Alias z Search-NavigationHistory

function Prompt {
	Update-NavigationHistory $pwd.Path
	$p = "";
	if(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
		$p = $p+"[Admin]";
	}
	"$p $pwd>"
}