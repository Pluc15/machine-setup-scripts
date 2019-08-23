Import-Module "$env:Dotfiles\windows\powershell\scripts\git-functions.psm1"
Import-Module "$env:Dotfiles\windows\powershell\scripts\utils.psm1"
Import-Module "$env:Dotfiles\windows\powershell\scripts\lpass.psm1"
Set-Alias -Name "lpass" -Value "Get-LastPass"
Set-Alias -Name "grep" -Value "findstr"
Set-Alias -Name "tail" -Value "Get-Tail"

If ($env:Dotfiles_MachineScripts) {
    $env:Path = "$env:Path;$env:Dotfiles_MachineScripts"
}

If ($env:Dotfiles_PowershellHome) {
    $CurrentLocation = Get-Location
    If ($CurrentLocation.Path -eq "$env:USERPROFILE") {
        Set-Location $env:Dotfiles_PowershellHome
    }
}

Function Prompt () {
    If (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "[Admin]" -NoNewLine -ForegroundColor "Red"
    }
    Write-Host $env:COMPUTERNAME -NoNewLine -ForegroundColor "White"
    Write-Host ": " -NoNewLine
    Write-Host $pwd.ProviderPath -ForegroundColor "Green"
    Write-Host "PS>" -NoNewLine -ForegroundColor "DarkGray"
    return " "
}

Write-Host "[Dotfiles Loaded]"
