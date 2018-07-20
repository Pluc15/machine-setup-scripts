Function tail($file) {
	Get-Content $file -Wait -Tail 10
}

Export-ModuleMember -Function *
