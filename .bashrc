export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
	if [ -n "$VIRTUAL_ENV" ]
	then
		echo "[ $(basename $VIRTUAL_ENV) ] "
	fi
}

export PS1="\$(venv)[ \u@\h ] [ \w ]\n> "

complete -cf doas

