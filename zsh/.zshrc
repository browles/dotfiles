setopt share_history

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
alias ls="ls --color=auto"
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
[[ $SSH_CONNECTION ]] && userhost="%F{blue}%n@%m %f"
PROMPT='${userhost}%F{cyan}%~ %f%F{red}${vcs_info_msg_0_}%f$ '

eval "$(dircolors ~/.dircolors)"
UNAME=$(uname)
if [[ "$UNAME" == "Darwin" ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
	source /opt/homebrew/share/autojump/autojump.zsh
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$UNAME" == "Linux" ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
  source /usr/share/doc/fzf/examples/key-bindings.zsh
	source /usr/share/autojump/autojump.zsh
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Fix FZF's Alt-C handling on a Mac keyboard
bindkey "ç" fzf-cd-widget
