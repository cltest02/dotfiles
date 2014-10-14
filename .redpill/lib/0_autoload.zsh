
############# AUTOLOAD ######################################

# http://zsh.sourceforge.net/Doc/Release/Functions.html

autoload -Uz promptinit ; promptinit
autoload -Uz colors ; colors
autoload -Uz complist
autoload -Uz computil
autoload -Uz compinit ; compinit -C
autoload -Uz edit-command-line ; zle -N edit-command-line
autoload -Uz url-quote-magic ; zle -N self-insert url-quote-magic

# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html

zmodload -i zsh/computil
zmodload -i zsh/complist

