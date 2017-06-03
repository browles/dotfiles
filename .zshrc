ZSH_THEME="daveverwer"

plugins=(git autojump osx)

alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias emacs="emacsclient --no-wait"

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
