ZSH_THEME="daveverwer"

plugins=(git autojump osx)

alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias ec="emacsclient --no-wait"
alias octave=octave-cli
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
