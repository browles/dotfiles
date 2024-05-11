export EDITOR=vim
export GPG_TTY=$(tty)
export PYENV_ROOT="$HOME/.pyenv"
export REPOS="$HOME/src"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export NOTES_DIRECTORY="$HOME/Dropbox/notes"

typeset -U path
export GOPATH="$HOME/go"
path=($GOPATH/bin $path)
path=($HOME/bin $path)
export GOPATH="$GOPATH:$(dirname $REPOS)"
export PATH
