# ~/.zshrc: executed by zsh

############# INCLUDE ####################################

# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{config_dotfiles,path,exports,colors,icons,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


############# SETOPT ######################################

setopt \
    `# please no beeps` \
    NO_BEEP \
    `# if a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory` \
    AUTO_CD \
    `# make cd push the old directory onto the directory stack` \
    AUTO_PUSHD \
    `# automatically list choices on an ambiguous completion` \
    AUTO_LIST \
    `# automatically use menu completion after the second consecutive request for completion` \
    AUTO_MENU \
    `# when listing files that are possible completions, show the type of each file with a trailing identifying mark` \
    LIST_TYPES \
    `# all unquoted arguments of the form identifier=expression appearing after the command name have file expansion` \
    MAGIC_EQUAL_SUBST \
    `# on an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately ...` \
    MENU_COMPLETE \
    `# don’t push multiple copies of the same directory onto the directory stack` \
    PUSHD_IGNORE_DUPS \
    `# resolve symbolic links to their true values when changing directory` \
    CHASE_LINKS \
    `# if unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends` \
    COMPLETE_IN_WORD \
    `# try to correct the spelling of commands` \
    CORRECT \
    `# when the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them` \
    GLOB_COMPLETE \
    `# more patterns for filename generation` \
    EXTENDED_GLOB \
    `# do not require a leading ‘.’ in a filename to be matched explicitly` \
    GLOB_DOTS \
    `# if a new command line being added to the history list duplicates an older one, the older command is removed from the list` \
    HIST_IGNORE_ALL_DUPS \
    `# remove command lines from the history list when the first character on the line is a space` \
    HIST_IGNORE_SPACE \
    `# remove the history (fc -l) command from the history list when invoked` \
    HIST_NO_STORE \
    `# remove superfluous blanks from each command line being added to the history list` \
    HIST_REDUCE_BLANKS \
    `# whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer` \
    HIST_VERIFY \
    `# this options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally` \
    INC_APPEND_HISTORY \
    `# list jobs in the long format by default` \
    LONG_LIST_JOBS \
    `# append a trailing ‘/’ to all directory names resulting from filename generation` \
    MARK_DIRS \
    `# ` \
    NO_NOTIFY \
    `# don’t push multiple copies of the same directory onto the directory stack` \
    PUSHD_IGNORE_DUPS \
    `# do not print the directory stack after pushd or popd` \
    PUSHD_SILENT \
    `# this option both imports new commands from the history file, and also causes your typed commands to be appended to the history file` \
    SHARE_HISTORY \
    `# remove any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods` \
    TRANSIENT_RPROMPT \
    `# allow comments even in interactive shells` \
    INTERACTIVE_COMMENTS \
    `# if a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word` \
    ALWAYS_TO_END


############# AUTOLOAD ######################################

autoload -Uz promptinit
promptinit
prompt walters

autoload colors ; colors
autoload -Uz compinit
compinit -C


############# ZSTYLE ######################################

compdef pkill=kill
compdef pkill=killall

zstyle ':completion:*' completer _complete _match _approximate _expand
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
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











