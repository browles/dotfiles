export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/etc/Caskroom"

if [ -f $HOME/.liftoff_profile ]; then
  export LIFTOFF="true"
  source $HOME/.liftoff_profile
fi

export PATH="$PATH:/anaconda3/bin"
