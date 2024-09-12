export PS1="\w > "
alias vi=helix
alias doas="doas "
complete -cf doas

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  wayfire &> /dev/null
fi
