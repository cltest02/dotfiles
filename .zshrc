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

source ~/.zprofile
source ~/.shellrc

if [ -d $HOME/.oh-my-zsh ]; then
  # Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

  if [[ -z "$CONFIG_OH_MY_ZSH_THEME" ]]; then
    CONFIG_OH_MY_ZSH_THEME="random"
  fi

  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  # time that oh-my-zsh is loaded.
  ZSH_THEME="$CONFIG_OH_MY_ZSH_THEME"

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
  plugins=($CONFIG_OH_MY_ZSH_PLUGINS)

  source $ZSH/oh-my-zsh.sh
fi