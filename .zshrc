ZSH_THEME="daveverwer"

plugins=(autojump macos)
alias emacs-kill="emacsclient -e \"(kill-emacs)\""
alias ec="emacsclient --no-wait"
alias octave=octave-cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias ag="ag --path-to-ignore ~/.ignore"
type brew &>/dev/null && alias ctags="`brew --prefix`/bin/ctags"
type google-chrome &>/dev/null && alias chrome=google-chrome
alias python=python3
alias pip=pip3
alias vimf='vim `fzf`'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zshenv

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
