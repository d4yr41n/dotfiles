export PATH=$PATH:~/.local/bin

source ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq "1" ]; then
    dwl -s shell &> /dev/null &
    while true; do
        dwlb -status all "$(status)"
        sleep 1
    done &
    wait -n
    kill $!
fi

