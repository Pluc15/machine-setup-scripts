Function Get-Tail($file) {
    Get-Content $file -Wait -Tail 10
}

Function Open-Dotfiles() {
    code "$env:Dotfiles"
}

Export-ModuleMember -Function *
