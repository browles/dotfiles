alias ag="ag --path-to-ignore ~/.ignore"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
type google-chrome &>/dev/null && alias chrome=google-chrome
alias python=python3
alias pip=pip3
alias v=vim
alias vimf='fzf --bind "enter:become(vim {})"'
alias vimdiff='vim -d'
alias vimrc='vim --cmd "cd ~/.config/nvim" ~/.config/nvim/init.lua'
alias zshrc='vim --cmd "cd ~" ~/.zshrc'
alias src='source ~/.zshenv && source ~/.zshrc'
alias fzf='fzf --reverse --preview="bat --color=always {} --style=numbers"'
alias ls="ls --color"
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Emacs style keybinds
bindkey -e
# Smart case-sensitive completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '(%b)%u%c '
zstyle ':vcs_info:git*' actionformats '(%a|%b)%u%c '
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
function +vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        hook_com[staged]+='&'
    fi
}
precmd() { vcs_info; }
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# LS colors
eval "$(gdircolors ~/.dircolors)"

source ~/.fzf.zsh
source /opt/homebrew/etc/profile.d/autojump.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
