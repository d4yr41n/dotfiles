left="("
right=")"

export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
    if test -n "$VIRTUAL_ENV"
    then
        echo "$left $(basename $VIRTUAL_ENV) $right "
    fi
}

export PS1="\$(venv)$left \u in \h $right $left \w $right\nλ "

export PATH=$PATH:~/.local/bin

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session sway
fi
