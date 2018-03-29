Function Get-FuzzyHistory
{
	$PSReadlineOption = Get-PSReadlineOption
	Get-Content -Path $PSReadlineOption.HistorySavePath | Select-Object -Unique | fzf
}

Export-ModuleMember -Function Get-FuzzyHistory
