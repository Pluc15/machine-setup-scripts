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
