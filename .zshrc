ZSH_THEME="daveverwer"

plugins=(git autojump osx)

alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias emacs="emacsclient --no-wait"
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

alias octave=octave-cli

eval "$(rbenv init -)"
