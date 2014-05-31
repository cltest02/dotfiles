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
for file in ~/.{path,exports,aliases,bash_aliases,bash_prompt,complete,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar cmdhist dotglob extglob cdable_vars; do
  shopt -s "$option" 2> /dev/null
done

############################################################

# append to the Bash history file, rather than overwriting it
shopt -s histappend

if [ "$UID" != 0 ]; then
  # rezize the windows-size if needed
  shopt -s checkwinsize

  # case-insensitive globbing (used in pathname expansion)
  shopt -s nocaseglob

  # autocorrect typos in path names when using `cd`
  shopt -s cdspell
fi

# try to use less for non-text-files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

