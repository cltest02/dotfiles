# TAKE A LOOK AT THIS SOURCES:
#
# https://wiki.archlinux.org/index.php/Zsh
# http://ohmyz.sh/
#

if [[ $- != *i* ]] || [ -z "$PS1" ]; then
  return 0
fi

# try to load global-bashrc
if [ -f /etc/zsh/zshrc ]; then
  . /etc/zsh/zshrc
fi

source ~/.shellrc
source ~/.zprofile
