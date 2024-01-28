export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
	if [ -n "$VIRTUAL_ENV" ]
	then
		echo "[ $(basename $VIRTUAL_ENV) ] "
	fi
}

battery() {
	if [ -f /sys/class/power_supply/BAT0/capacity ]
	then
		value=$(cat /sys/class/power_supply/BAT0/capacity)
	fi
	if [ -n "$value" ]
	then
		echo "[ $value% ] "
	fi
}

export PS1="\$(venv)[ \u@\h ] [ \w ] \$(battery)[ \t ]\n> "

