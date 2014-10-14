## command history configuration

# info: You should be sure to set the value of HISTSIZE to a larger number than SAVEHIST in order to give you some room for the duplicated events
HISTSIZE=20000
SAVEHIST=10000

if [ -z $HISTFILE ]; then
  HISTFILE=$HOME/.zsh_history
fi
