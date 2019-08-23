# Install

- Install [Arch Linux WSL](https://github.com/yuk7/ArchWSL)
- As admin, run `install.ps1`
- Open WSL terminal
- Set root password
- Create pluc and set password
- Add pluc to sudoers
- Remove auto logged in user
- Run `wsl/install.sh`

# Adding hotkeys in powershell

```powershell
Set-PSReadlineKeyHandler -Key Ctrl+R `
    -BriefDescription "FuzzyHistory" `
    -LongDescription "FuzzyHistory" `
    -ScriptBlock {
    param($key, $arg)
    Get-FuzzyHistory
}
```

# sudo in powershell (WIP)

```powershell
function RunElevated {
    param([string]$Arguments = $args)
    $psi = New-Object System.Diagnostics.ProcessStartInfo powershell;
    $psi.Arguments = $Arguments;
    $psi.CreateNoWindow = $true;
    $psi.Verb = "runas";
    $psi.WorkingDirectory = Get-Location;
    $psi.UseShellExecute = $false;
    $psi.RedirectStandardError = $true;
    $psi.RedirectStandardInput = $true;
    $psi.RedirectStandardOutput = $true;
    [System.Diagnostics.Process]::Start($psi);
}
```
