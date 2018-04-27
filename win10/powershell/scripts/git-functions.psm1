Function ggt {
	$fmtCommitHash = '%C(bold blue)%h%C(reset)'
	$fmtBranch = '%C(auto)%>|(40,trunc)%D%C(reset)'
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
	if ($msg) {
		git commit -m $msg 
 }
 else {
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

Function gge {
	gitex.cmd browse (pwd).Path
}

Export-ModuleMember -Function *
