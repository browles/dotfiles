alias ag="ag --path-to-ignore ~/.ag-ignore"
type brew &>/dev/null && alias ctags="`brew --prefix`/bin/ctags"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
type google-chrome &>/dev/null && alias chrome=google-chrome
alias python=python3
alias pip=pip3
alias vim=nvim
alias vimf='vim `fzf`'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

ZSH_THEME="daveverwer"
plugins=(autojump macos)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zshenv

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

