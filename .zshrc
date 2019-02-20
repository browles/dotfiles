ZSH_THEME="daveverwer"

plugins=(autojump osx)
alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias ec="emacsclient --no-wait"
alias octave=octave-cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias ag="ag --path-to-ignore ~/.ignore"
type google-chrome &>/dev/null && alias chrome=google-chrome

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

if [ -f $HOME/.liftoff_profile ]; then
  source $HOME/.liftoff_profile
  export PATH="$PATH:/anaconda3/bin"
fi
