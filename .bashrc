left="("
right=")"

export VIRTUAL_ENV_DISABLE_PROMPT=1

venv() {
    if test -n "$VIRTUAL_ENV"
    then
        echo "$left $(basename $VIRTUAL_ENV) $right "
    fi
}

export PS1="\$(venv)$left \u in \h $right $left \w $right\nλ "

complete -cf doas

