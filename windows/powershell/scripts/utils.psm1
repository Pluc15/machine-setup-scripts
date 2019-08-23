Function Get-Tail($file) {
    Get-Content $file -Wait -Tail 10
}

Function dotfiles() {
    code "$env:Dotfiles"
}

Export-ModuleMember -Function *
