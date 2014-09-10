#!/usr/bin/env bash

echo "      _       _         __ _ _"
echo "   __| | ___ | |_      / _(_) | ___  ___"
echo "  / _\` |/ _ \| __|____| |_| | |/ _ \/ __|"
echo " | (_| | (_) | ||_____|  _| | |  __/\__ \\"
echo "  \__,_|\___/ \__|    |_| |_|_|\___||___/"
echo ""

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "firstInstall.sh" --exclude "android_sdk_install.sh" \
        --exclude ".gitignore" --exclude ".gitattributes" \
        --exclude "LICENSE-MIT.txt" --exclude ".editorconfig" \
        --exclude "examples/" \
        -avhi --no-perms . ~

  if [ ! -f ~/.config_dotfiles ]; then
    cp .config_dotfiles_default ~/.config_dotfiles
  fi

  # install oh-my-zsh
  if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

    read -p "Do you want to use the zsh-shell? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      chsh -s $(which zsh)
    fi

  else
    cd ~/.oh-my-zsh
    git pull
  fi

  # install vim-plugin-manager
  if [ ! -d ~/.vim/bundle/vundle ]; then
    mkdir ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo "run ':BundleInstall' or ':BundleUpdate' in vim command mode"
  else
    cd ~/.vim/bundle/vundle
    git pull
  fi
}

function dryRun() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "firstInstall.sh" --exclude "android_sdk_install.sh" \
        --exclude ".gitignore" --exclude ".gitattributes" \
        --exclude "LICENSE-MIT.txt" --exclude ".editorconfig" \
        --exclude "examples/" \
        -avhni --no-perms . ~
	source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
  echo "Executing dry run..."
  echo

  dryRun
  echo
  echo
  read -p "The files listed above will overwritten in your home directory. Are you sure you want to continue? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi

unset doIt
unset dryRun
