Function Get-LastPass {
    $lpassArgs = $args -join " "
    Invoke-Expression "wsl -- lpass $lpassArgs"
}

Export-ModuleMember -Function *
