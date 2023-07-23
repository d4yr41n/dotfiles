export PATH=$PATH:~/.local/bin

printf -v left "\uE0B3"
printf -v right "\uE0B1"
export PS1="$left\u$right $left\w$right "

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session sway
fi
