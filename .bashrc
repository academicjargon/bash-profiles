# .bashrc is a shell script that Bash runs whenever it is started interactively. 
# It initializes an interactive shell session. 
# You can put any command in that file that you could type at the command prompt.
# I use this on PC

# \033]01;31\] # pink 
# \033]00m\]   # white
# \033]01;36\] # bold green
# \033]02;36\] # green
# \033]01;34\] # blue 
# \033]01;33\] # bold yellow
# All others: https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt

# Append to the history file instead of overwrite it
shopt -s histappend
#echo $(date)

# Append the previous command to history each time a prompt is shown
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Increase history size
export HISTSIZE=1000
export HISTFILESIZE=1000

# Customize prompt
# export PS1='\[\033[01;32m\]\u@localhost:\[\033[01;34m\] \w \$\[\033[00m\] '
export PS1='\[\033[01;32m\]\[\033[33m\]\u\[\033[37m\]@\[\033[32m\]localhost\[\033[37m\]:\[\033[32m\]\l:\[\033[01;33m\]\w'
export PS1=${PS1}'\[\033[37m\]\$ \[\033[00m\]'

#
# Set EDITOR
#

editors=(
    "@PROGRAMFILES@\Sublime Text 3\sublime_text.exe!-w -n"
    "@PROGRAMFILES@\Sublime Text 2\sublime_text.exe!-w -n"
    "@PROGRAMFILES@\Notepad++\notepad++.exe!-nosession -multiInst"
)

editor=
for item in "${editors[@]}"; do
    if [[ "$item" = *@PROGRAMFILES@* ]]; then
        for pfpath in "$PROGRAMFILES" "$PROGRAMW6432"; do
            cmd="${item/@PROGRAMFILES@/$pfpath}"
            if [ -f "${cmd%!*}" ]; then
                editor="$cmd"
                break 2
            fi
        done
    elif [ -f "${item%!*}" ]; then
        editor="$item"
        break
    fi
done

if [ -n "$editor" ]; then
    export EDITOR="'${editor%!*}' ${editor#*!}"
else
    export EDITOR=${EDITOR:-vim}
    echo
    echo "!! Cannot find Sublime Text or Notepad++! If you don't want to use $EDITOR"
    echo "!! as your default editor, then install one of these, or you will cry..."
    echo
fi


#
# Auto-launch ssh-agent
# Source: https://help.github.com/articles/working-with-ssh-key-passphrases
#

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.
env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).
agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env


#
# Aliases
#

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'
alias cp='cp -irv'
alias du='du -h --max-depth=1'
alias ll='ls -FGahl --show-control-chars --color=always'
alias ls='ls -AF --show-control-chars --color=always'
alias md='mkdir -p'
alias mv='mv -iv'
alias rm='rm -ir'
alias edit='eval "$EDITOR"'
