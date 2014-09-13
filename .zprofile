# ~/.zprofile: executed by zsh

# you will find all other settings in "~/.oh-my-zsh"

############# INCLUDE ####################################

# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{config_dotfiles,path,exports,colors,icons,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

