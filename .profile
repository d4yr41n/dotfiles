export PATH=${PATH}:~/.local/bin
export PS1="\w > "
alias hx=helix

if [ -z ${WAYLAND_DISPLAY} ] && [ $(tty) = "/dev/tty1" ]; then
	dwl -s "exec <&-; while true; do echo ' $(date +%R) '; sleep 5; done | ergo -F 'Fantasque Sans Mono 19' -b '3f3f3f'"
fi
