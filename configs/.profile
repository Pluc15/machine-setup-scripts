if test -d ~/.config/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi
echo "[$(date -Iseconds)] $0 - Done" >> ~/.dotfiles_logs
