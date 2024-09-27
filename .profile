export PS1="\w > "
export PATH=${PATH}:~/.local/bin
alias doas="doas "
alias vi=helix
complete -cf doas

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  dwl -s "wl-script init"
fi
