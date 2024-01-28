export PATH=$PATH:~/.local/bin

source ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" = "1" ]; then
    dwl &> /dev/null
fi

