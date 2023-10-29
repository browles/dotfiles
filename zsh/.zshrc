alias ag="ag --path-to-ignore ~/.ignore"
type brew &>/dev/null && alias ctags="`brew --prefix`/bin/ctags"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
type google-chrome &>/dev/null && alias chrome=google-chrome
alias python=python3
alias pip=pip3
alias vim=nvim
alias vimf='vim `fzf`'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

bindkey -e 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
