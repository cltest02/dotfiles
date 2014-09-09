# TAKE A LOOK AT THIS SOURCES: ".bashrc"
#

if [[ $- != *i* ]] || [ -z "$PS1" ]; then
  return 0
fi

# try to load global-bashrc
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

source ~/.zprofile
source ~/.shellrc