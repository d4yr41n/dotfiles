printf -v left "\uE0B3"
printf -v right "\uE0B1"

export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
    if test -n "$VIRTUAL_ENV"
    then
        echo "$left${VIRTUAL_ENV##*/}$right "
    fi
}

export PS1="\$(venv)$left\u$right $left\w$right "

export PATH=$PATH:~/.local/bin

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session sway
fi
