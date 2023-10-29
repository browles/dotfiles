alias ag="ag --path-to-ignore ~/.ignore"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
type google-chrome &>/dev/null && alias chrome=google-chrome
alias python=python3
alias pip=pip3
alias vim=nvim
alias v=vim
alias vimf='vim `fzf`'
alias vimrc='vim --cmd "cd ~/.config/nvim" ~/.config/nvim/init.lua'
alias zshrc='vim --cmd "cd ~" ~/.zshrc'
alias src='source ~/.zshenv && source ~/.zshrc'
alias ls="gls --color"
alias g="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias ..="cd .."
alias ...="cd ..."
alias ....="cd ...."

# Emacs style keybinds
bindkey -e
# Smart case-sensitive completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b%u%c '
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true
precmd() { vcs_info; }
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# LS colors
eval "$(gdircolors ~/.dircolors)"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
