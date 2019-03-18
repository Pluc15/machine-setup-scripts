if test -n "$SHELLROOT"
	cd "$SHELLROOT"
end

function fish_prompt
	set_color normal
	echo -n (hostname)
	echo -n ": "
	set_color 0F0
	echo (pwd)
	set_color 999
	echo -n 'WSL> '
	set_color normal
end