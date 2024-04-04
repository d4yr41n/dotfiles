export PATH=$PATH:~/.local/bin

source ~/.bashrc

if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
    if ! [ -d "${XDG_RUNTIME_DIR}" ]; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
	dbus-run-session dwl -s "desktop init | ergo -F 'Fantasque Sans Mono 19' -b 3f3f3f"
fi

