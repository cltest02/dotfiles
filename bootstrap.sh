#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "firstInstall.sh" --exclude "android_sdk_install.sh" \
        --exclude ".gitignore" --exclude ".gitattributes" \
        --exclude "LICENSE-MIT.txt" --exclude ".editorconfig" \
        --exclude "examples/" \
        -avhi --no-perms . ~
  
  if [ ! -f "~/.config_dotfiles" ]; then
    cp .config_dotfiles_default ~/.config_dotfiles
  fi

	source ~/.bash_profile
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
