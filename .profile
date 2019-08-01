# .bash_profile and .bashrc are specific to bash
# .profile is read by many shells in the absence of their own shell-specific config files. 
# (.profile was used by the original Bourne shell.) 
# .bash_profile or .profile is read by login shells, along with .bashrc 
# subshells read only .bashrc
# I don't use this.

# \033]01;31\] # pink 
# \033]00m\]   # white 
# \033]01;36\] # bold green 
# \033]02;36\] # green 
# \033]01;34\] # blue 
# \033]01;33\] # bold yellow 
# All others: https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
# Use nano instead of vim
EDITOR=nano

# always list in long format
alias ls='ls -la --color'

# set dynamic prompt and window/tab title
PS1='\[\e]0;${PWD##*/}\a\]\n'  # set window title
#PS1="$PS1"'\u@\h '            # user@host<space>
PS1="$PS1"'\[\033[32m\]'       # change color
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
    PS1="$PS1"'\[\033[33m\]'   # change color
    PS1="$PS1"'$(__git_ps1)'   # bash function

fi
PS1="$PS1"'\[\033[0m\]\n'      # change color
PS1="$PS1"'$ '                 # prompt: always $

# Append to the history file instead of overwrite it
shopt -s histappend
echo $(date)

# Append the previous command to history each time a prompt is shown
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Increase history size
export HISTSIZE=1000
export HISTFILESIZE=1000

export PS1='\[\033[01;32m\]\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]localhost\[\033[37m\]:\[\033[32m\]\l:\[\033[01;33m\]\w'
export PS1=${PS1}'\[\033[37m\]\$ \[\033[00m\]'
