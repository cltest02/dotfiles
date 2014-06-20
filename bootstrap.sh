#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
  git config --global -l | LANG=C sort > /tmp/oldgit$$
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "firstInstall.sh" \
        --exclude ".gitignore" --exclude ".gitattributes" \
        --exclude "LICENSE-MIT.txt" -avhi --no-perms . ~
	source ~/.bash_profile

  git config --global -l | LANG=C sort > /tmp/newgit$$

  echo "git configuration not present anymore after bootstrapping:"
  LANG=C comm -23 /tmp/oldgit$$ /tmp/newgit$$
  echo -e "\nYou can use the following commands to add it again:"
  for i in $(LANG=C comm -23 /tmp/oldgit$$ /tmp/newgit$$); do echo "git config --global --add "$(echo $i | sed 's/=/ /') ;done
}

function dryRun() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "firstInstall.sh" \
        --exclude ".gitignore" --exclude ".gitattributes" \
        --exclude "LICENSE-MIT.txt" -avhni --no-perms . ~
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
