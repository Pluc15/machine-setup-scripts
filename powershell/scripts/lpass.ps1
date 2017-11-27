$lpassArgs = $args -join " "
Invoke-Expression "&`"bash`" -l  -c `"/usr/bin/lpass $lpassArgs`""