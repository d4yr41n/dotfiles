export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
	if [ -n "$VIRTUAL_ENV" ]
	then
		PS1="\[\e[107m\] $(basename $VIRTUAL_ENV) \[\e[97;100m\]\[\e[39m\]"
	fi
}

prompt() {
	PS1=
	venv
	PS1="${PS1}\[\e[100m\] \w \[\e[49;90m\]\[\e[39m\] "
}

PROMPT_COMMAND="prompt"
export PS1

complete -cf doas

