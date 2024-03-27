export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
	if [ -n "$VIRTUAL_ENV" ]
	then
		echo -e "\e[107m $(basename $VIRTUAL_ENV) \e[97;100m\e[0m"
	fi
}

export PS1="\$(venv)\[\e[100m\] \w \[\e[49;90m\]\[\e[39m\] "

complete -cf doas

