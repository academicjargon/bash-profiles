# .bash_profile is a configuration file for bash shell. 
# When bash is invoked as an interactive login shell it first reads and executes commands from ~/.bash_profile... 
# This file can be used to export variables in shell. 
# You can put your variables in ~/.bashrc also apart from bash profile
# I use this on Mac

alias VS="open -a 'Visual Studio Code.app'"
alias vs="open -a 'Visual Studio Code.app'"
alias VSC="open -a 'Visual Studio Code.app'"
alias vsc="open -a 'Visual Studio Code.app'"
alias VisualStudioCode="open -a 'Visual Studio Code.app'"
alias VisualStudio="open -a 'Visual Studio Code.app'"
alias Safari="open -a 'Safari.app'"alias Finder="open -a 'Finder.app'"
alias finder="open -a 'Finder.app'"
alias Preview="open -a 'Preview.app'"
alias preview="open -a 'Preview.app'"
alias archive="open -a 'Archive Utility.app'"
alias uncompress="open -a 'Archive Utility.app'"
alias compress="open -a 'Archive Utility.app'"
alias atom="open -a 'Atom.app'"
alias edit="open -a 'Atom.app'"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
#alias ls='ls -GFh'
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
