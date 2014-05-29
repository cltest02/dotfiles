# If not running interactively: exit immediately.
# Note that 'return' works because the file is sourced, not executed.
if [[ $- != *i* ]] || [ -z "$PS1" ]; then
  return 0
fi

############# INCLUDE ####################################

# try to load global-bashrc
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# settings for chroot
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,bash_aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

############################################################

# rezize the windows-size if needed
shopt -s checkwinsize

# case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# append to the Bash history file, rather than overwriting it
shopt -s histappend

# autocorrect typos in path names when using `cd`
shopt -s cdspell

# try to use less for non-text-files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!" 
}

function __git_branch {
  __git_ps1 "[%s]"
}

shell_colored() {
  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local NO_COLOUR="\[\033[0m\]"
  local BLUE="\[\033[0;34m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local PURPLE="\[\033[0;35m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local BROWN="\[\033[0;33m\]"
  local YELLOW="\[\033[1;33m\]"
  local BLACK="\[\033[0;30m\]"
  local WHITE="\[\033[1;37m\]"

  local UC=$GREEN                 # user's color
  [ $UID -eq "0" ] && UC=$RED     # root's color

  # set colors for the bash-prompt
  PS1="\n${debian_chroot:+($debian_chroot)}$LIGHT_GREEN\u$LIGHT_BLUE@$LIGHT_GREEN\h$LIGHT_GRAY:$LIGHT_BLUE\w$LIGHT_RED->\$(__git_branch)$R\$(__git_dirty)$NO_COLOUR "
}
shell_colored

# set the title for xterm (user@host:dir)
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='color_prompt=yes; echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
  ;;

  *)
  ;;
esac

