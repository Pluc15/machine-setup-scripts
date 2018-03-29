Function gt {
	$fmtCommitHash = '%C(bold blue)%h%C(reset)'
	$fmtBranch = '%C(bold yellow)%>|(40,trunc)%D%C(reset)'
	$fmtMessage = '%C(white)%s%C(reset)'
	$fmtAuthor = '%C(dim white)%an%C(reset)'
	$fmtDatetime = '%C(bold green)%ar%C(reset)'
	git log `
		--graph `
		--abbrev-commit `
		--decorate `
		--format=format:"$fmtCommitHash $fmtBranch $fmtMessage - by $fmtAuthor $fmtDatetime" `
		--all
}

Function gf {
	git fetch --all
}

Function gs {
	git status
}

Function gpull {
	git pull
}

Function gpush {
	git push
}

Export-ModuleMember -Function gt
Export-ModuleMember -Function gf
Export-ModuleMember -Function gs
Export-ModuleMember -Function gpull
Export-ModuleMember -Function gpush
