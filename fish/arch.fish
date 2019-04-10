if [ -z "$DISPLAY" ]; and [ -n "$XDG_VTNR" ]; and [ "$XDG_VTNR" -eq 1 ]
  exec startx
end

function fish_prompt
	set_color normal
	echo -n (hostname)
	echo -n ": "
	set_color green
	echo (pwd)
	set_color white
	echo -n '> '
	set_color normal
end