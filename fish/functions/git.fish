function ggt
	set fmtCommitHash "%C(bold cyan)%h%C(reset)"
	set fmtBranch "%C(auto)%D%C(reset)"
	set fmtMessage "%C(white)%s%C(reset)"
	set fmtAuthor "%C(dim white)%an%C(reset)"
	set fmtDatetime "%C(bold green)%ar%C(reset)"
	git log \
			--graph \
			--abbrev-commit \
			--decorate \
			--format=format:"$fmtCommitHash $fmtBranch $fmtMessage - by $fmtAuthor $fmtDatetime" \
			--all
end

function ggf
	git fetch --all
end

function ggpl
	git pull
end

function ggph
	git push
end

function ggs
	git status 
end

function ggr
	cd (git rev-parse --show-toplevel)
end