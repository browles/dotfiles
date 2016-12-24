export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="daveverwer"

plugins=(git autojump emacs osx)

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

export PATH="$PATH:~/.rvm/bin"
export PATH="$PATH:~/Library/Haskell/bin"
export PATH="$PATH:~/Library/Frameworks/Python.framework/Versions/3.4/bin"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/etc/Caskroom"
