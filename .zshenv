export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)
export GOPATH="$HOME/go"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/usr/local/bin"
export FONTCONFIG_PATH="/opt/X11/lib/X11/fontconfig"
export FZF_DEFAULT_COMMAND="ag -g ''"
export FZF_CTRL_T_COMMAND="ag -g ''"

if [ -f $HOME/.liftoff_profile ]; then
  export LIFTOFF="true"
  export PRESTO_HOME=$HOME/presto
  export HADOOP_HOME=$HOME/hadoop
  export HIVE_HOME=$HOME/hive
  export HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec
  export JAVA8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
  export JAVA11_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
  export PATH=$JAVA_HOME/bin:$PATH
  source $HOME/.liftoff_profile
fi
