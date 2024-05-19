export EDITOR=vim
export GPG_TTY=$(tty)
export PYENV_ROOT="$HOME/.pyenv"
export REPOS="$HOME/src"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export NOTES_DIRECTORY="$HOME/Dropbox/notes"
export FZF_DEFAULT_COMMAND="fd -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H --type d"

typeset -U path
export GOPATH="$HOME/go"
path=($GOPATH/bin $path)
path=($PYENV_ROOT/bin $path)
path=($HOME/bin $path)
export GOPATH="$GOPATH:$(dirname $REPOS)"
export PATH
