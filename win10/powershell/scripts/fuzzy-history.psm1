Function Get-FuzzyHistory
{
	$PSReadlineOption = Get-PSReadlineOption
	Invoke-Expression (Get-Content -Path $PSReadlineOption.HistorySavePath | fzf)
}

Export-ModuleMember -Function Get-FuzzyHistory
