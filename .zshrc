export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="daveverwer"

plugins=(git autojump emacs osx)

alias emacs-kill="emacsclient -e \"(kill-emacs)\""

export GOPATH="$HOME/go"
export PATH="$PATH:~/.rvm/bin"
export PATH="$PATH:~/Library/Haskell/bin"
export PATH="$PATH:~/Library/Frameworks/Python.framework/Versions/3.4/bin"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/etc/Caskroom"
export NODE_PATH="/usr/local/lib/node_modules"

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/nvm/nvm.sh

if [ -f $HOME/.liftoff_profile ]; then
  source $HOME/.liftoff_profile
fi

eval "$(rbenv init -)"
