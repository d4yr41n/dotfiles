export PATH=$PATH:~/.local/bin

export BEMENU_OPTS="
--fn 'Fantasque Sans Mono 19' -p '>>>' -H '35' -B '2' --bdr '#7FFF7F'
--hb '#7FFF7F' --hf '#000000'
--fb '#000000' --ff '#7FFF7F'
--cb '#000000' --cf '#7FFF7F'
--nb '#000000' --nf '#7FFF7F'
--tb '#000000' --tf '#7FFF7F'
--ab '#000000' --af '#7FFF7F'
"

source .bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    river &> /dev/null
fi
