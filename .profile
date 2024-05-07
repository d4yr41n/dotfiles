export PATH=${PATH}:~/.local/bin
export PS1="\w > "

if [ -z ${XDG_RUNTIME_DIR} ]; then
	export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
	mkdir -pm 0700 ${XDG_RUNTIME_DIR}
fi

if [ -z ${WAYLAND_DISPLAY} ] && [ $(tty) = "/dev/tty1" ]; then
	dwl -s "desktop init"
fi
