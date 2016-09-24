cite about-alias
about-alias 'general aliases'

alias _='sudo'

which gshuf &> /dev/null
if [ $? -eq 0 ]; then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"
