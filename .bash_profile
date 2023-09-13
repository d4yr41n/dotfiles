export PATH=$PATH:~/.local/bin

source ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    sway &> /dev/null
fi
