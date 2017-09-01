# Register custom scripts
Get-ChildItem "$env:Dotfiles\windows\scripts" -Filter *.ps1 | 
Foreach-Object {
	Set-Alias -Name $_.BaseName -Value $_.FullName
}

# # lpass
# Function RunInBash
# {
# 	$a = $args -join " "
# 	Invoke-Expression "& bash -l -c 'lpass $a'"
# }
# Set-Alias lpass RunInBash

# Z
Import-Module z
Set-Alias z Search-NavigationHistory

function Prompt {
	Update-NavigationHistory $pwd.Path
	"$pwd>"
}