Function ggt($Lines = 200) {
	$fmtCommitHash = '%C(bold cyan)%h%C(reset)'
	$fmtBranch = '%C(auto)%D%C(reset)'
	$fmtMessage = '%C(white)%s%C(reset)'
	$fmtAuthor = '%C(dim white)%an%C(reset)'
	$fmtDatetime = '%C(bold green)%ar%C(reset)'
	git log `
		--graph `
		--abbrev-commit `
		--decorate `
		--format=format:"$fmtCommitHash $fmtBranch $fmtMessage - by $fmtAuthor $fmtDatetime" `
		--all `
		-$Lines
}

Function ggf {
	git fetch --all
}

Function ggpl {
	git pull
}

Function ggph {
	git push
}

Function ggs {
	git status 
}

Function ggr {
	Push-Location (git rev-parse --show-toplevel) 
}

Export-ModuleMember -Function *
