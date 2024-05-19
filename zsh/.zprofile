UNAME=$(uname)
if [[ "$UNAME" == "Darwin" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(rbenv init -)"
eval "$(pyenv init -)"
