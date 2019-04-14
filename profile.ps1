# Register custom scripts and modules
Import-Module "$env:Dotfiles\powershell\scripts\git-functions.psm1"
Import-Module "$env:Dotfiles\powershell\scripts\utils.psm1"
Import-Module "$env:Dotfiles\powershell\scripts\fuzzy-history.psm1"
Import-Module "$env:Dotfiles\powershell\scripts\lpass.psm1"
Import-Module "$env:Dotfiles\submodules\z.ps\z.psm1"
Set-Alias -Name "lpass" -Value "Get-LastPass"
Set-Alias -Name "grep" -Value "findstr"
Set-Alias z Search-NavigationHistory

# Add machine scripts to path
If ($env:Dotfiles_MachineScripts) {
	$env:Path = "$env:Path;$env:Dotfiles_MachineScripts"
}

# Go to home folder if Powershell wasnt started with a specific location
If ($env:Dotfiles_PowershellHome) {
	$CurrentLocation = Get-Location
	If ($CurrentLocation.Path -eq "$env:HOMEDRIVE$env:HOMEPATH") {
		Set-Location $env:Dotfiles_PowershellHome
	}
}

# Hotkeys
Set-PSReadlineKeyHandler -Key Ctrl+R `
	-BriefDescription "FuzzyHistory" `
	-LongDescription "FuzzyHistory" `
	-ScriptBlock {
	param($key, $arg)
	Get-FuzzyHistory
}

# Prompt
Function Prompt () {
	Update-NavigationHistory $pwd.Path
	If (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
		Write-Host "[Admin]" -NoNewLine -ForegroundColor "Red"
	}
	Write-Host $env:COMPUTERNAME -NoNewLine -ForegroundColor "White"
	Write-Host ": " -NoNewLine
	Write-Host $pwd.ProviderPath -ForegroundColor "Green"
	Write-Host "PS>" -NoNewLine -ForegroundColor "DarkGray"
	return " "
}