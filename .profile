export PS1="\w > "
export PATH=${PATH}:~/.local/bin
alias doas="doas "

if [ -n "$(command -v helix)" ]; then
  alias vi=helix
elif [ -n "$(command -v hx)" ]; then
  alias vi=hx
fi


complete -cf doas

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR:-0}" -eq 1 ]; then
  dwl -s "wl-script init"
fi
