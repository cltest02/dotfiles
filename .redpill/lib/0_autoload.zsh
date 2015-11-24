
############# AUTOLOAD ######################################

# http://zsh.sourceforge.net/Doc/Release/Functions.html

autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz complist
autoload -Uz computil
autoload -Uz compinit && compinit -C
autoload -Uz edit-command-line && zle -N edit-command-line

# bracketed-paste-magic is known buggy in zsh 5.1.1 (only), so skip it there; see #4434
autoload -Uz is-at-least
if [[ $ZSH_VERSION != 5.1.1 ]]; then
  for d in $fpath; do
    if [[ -e "$d/url-quote-magic" ]]; then
      if is-at-least 5.1; then
        autoload -Uz bracketed-paste-magic
        zle -N bracketed-paste bracketed-paste-magic
      fi
      autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic
      break
    fi
  done
fi

# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html

zmodload -i zsh/computil
zmodload -i zsh/complist
zmodload -i zsh/langinfo

