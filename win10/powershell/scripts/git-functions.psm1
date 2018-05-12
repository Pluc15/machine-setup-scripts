Function ggt($Lines = 30) {
	$fmtCommitHash = '%C(bold cyan)%h%C(reset)'
	$fmtBranch = '%C(auto)%>|(40,trunc)%D%C(reset)'
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

Function gga($file) {
	git add $file 
}

Function ggai {
	git add --interactive 
}

Function ggaa {
	git add --all 
}

Function ggc($msg) {
	If ($msg) {
		git commit -m $msg 
 }
 Else {
		git commit 
 } 
}

Function ggca {
	git commit --amend 
}

Function ggd {
	git diff 
}

Function ggds {
	git diff --staged 
}

Function ggroot {
	Push-Location (git rev-parse --show-toplevel) 
}

Function gge(
	[ValidateSet('browse', 'commit')]
	$Action = "browse", 
	$Path) {
	if ($Path) {
		gitex.cmd browse (Resolve-Path $Path)
	}
	Else {
		gitex.cmd browse (Get-Location).Path
	}
}

Export-ModuleMember -Function *
