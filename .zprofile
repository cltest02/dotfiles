# ~/.zshrc: executed by zsh

############# INCLUDE ####################################

# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{config_dotfiles,path,exports,colors,icons,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


############# SETOPT ######################################

setopt AUTO_CD \
   AUTO_PUSHD \
   AUTO_LIST \
   AUTO_MENU \
   MENU_COMPLETE \
   PUSHD_IGNORE_DUPS \
   CHASE_LINKS \
   COMPLETE_IN_WORD \
   CORRECT \
   EXTENDED_GLOB \
   GLOB_DOTS \
   HIST_IGNORE_ALL_DUPS \
   HIST_IGNORE_SPACE \
   HIST_NO_STORE \
   HIST_REDUCE_BLANKS \
   HIST_VERIFY \
   INC_APPEND_HISTORY \
   LONG_LIST_JOBS \
   MARK_DIRS \
   NO_NOTIFY \
   PUSHD_IGNORE_DUPS \
   PUSHD_SILENT \
   SHARE_HISTORY \
   TRANSIENT_RPROMPT


############# AUTOLOAD ######################################

autoload -Uz promptinit
promptinit
prompt walters

autoload colors ; colors
autoload -Uz compinit
compinit -C


############# ZSTYLE ######################################

zstyle ':completion:*' completer _complete _match _approximate _expand
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format "No match in: %B%d%b"zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'

############# BINDKEY ######################################

bindkey -e
bindkey '^i' expand-or-complete-prefix                  # Tab
bindkey "^[[2~" yank                                    # Insert
bindkey "^[[3~" delete-char                             # Del
bindkey "^[[5~" history-beginning-search-backward       # PageUp
bindkey "^[[6~" history-beginning-search-forward        # PageDown
bindkey "^[e" expand-cmd-path                           # Alt-e
bindkey "^[[A" up-line-or-search                        # up arrow
bindkey "^[[B" down-line-or-search                      # down arrow
bindkey " " magic-space                                 # history expansion on space











