ZSH_THEME="daveverwer"

plugins=(git autojump osx)

alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias ec="emacsclient --no-wait"
alias octave=octave-cli
type google-chrome &>/dev/null && alias chrome=google-chrome
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
