[![Stories in Ready](https://badge.waffle.io/voku/dotfiles.svg?label=ready&title=Ready)](http://waffle.io/voku/dotfiles)

# dotfiles for bash / zsh

![Screenshot of my shell prompt](http://suckup.de/wp-content/uploads/2014/06/bash_prompt.png)


## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
cd ~ ; git clone https://github.com/voku/dotfiles.git; cd dotfiles; ./firstInstall.sh ; ./ bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

### Add custom commands without creating a new fork

If `~/.config_dotfiles` does not exists, the "bootstrap.sh"-script will create a default config for you.

My `~/.config_dotfiles` looks something like this:

```bash
#!/bin/bash

CONFIG_DEFAULT_USER="lars"
CONFIG_ZSH_PLUGINS="(git bower composer ruby bundler gem)"
CONFIG_ZSH_THEME="voku"
CONFIG_BASH_THEME="voku"
CONFIG_CHARSET_UTF8=true
CONFIG_LANG="en_US"
CONFIG_TERM_LOCAL="" # terms: screen byobu tmux
CONFIG_TERM_SSH=""
```

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
#!/bin/bash
GIT_AUTHOR_NAME="Lars Moelleken"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="lars@moelleken.org"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global push.default simple
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/voku/dotfiles/fork) instead, though.


## Screenshot

Debian / Ubuntu: package search & install:
![Debian / Ubuntu: package search & install](https://lh6.googleusercontent.com/-4wgyNUx-5lU/VBaLoHkCIkI/AAAAAAAAEps/pDB4j-miYB0/w1152-h852-no/apt.gif)

pushd / popd: push and pop directories on directory stack:
![pushd / popd: push and pop directories on directory stack](https://lh3.googleusercontent.com/-l1vjmWrWqt0/VBaLoFuDegI/AAAAAAAAEpk/QyCvxleninE/w1152-h852-no/cd.gif)

easier navigation via aliases:
![easier navigation via aliases](https://lh5.googleusercontent.com/-FM9MfR5aubU/VBaLnwZ2ahI/AAAAAAAAEp0/IaCkh-o6FG0/w1152-h852-no/cd_v2.gif)

color for ping / traceroute / ps / top / ...:
![color for ping / traceroute / ps / top / ...](https://lh4.googleusercontent.com/-BCzdV0iWpNM/VBaLosHohzI/AAAAAAAAEp8/-wV8lMW6F50/w1152-h852-no/color.gif)

more useful shortcuts:
![more useful shortcuts](https://lh3.googleusercontent.com/-RRqTWa4US6w/VBaLosCrfYI/AAAAAAAAEqE/_RnpJBO6N8E/w1152-h852-no/date.gif)

difflight & filename auto-completion via zsh:
![difflight & filename auto-completion via zsh](https://lh3.googleusercontent.com/-PrczDV4plG8/VBaLpMJzXhI/AAAAAAAAEqU/nNK6q3JY5Gs/w1152-h852-no/diff_v2.gif)

copy text via "getclip" & putclip":
![copy text via "getclip" & putclip](https://lh5.googleusercontent.com/-8akAgcHLS2s/VBaLpzImBsI/AAAAAAAAEqc/-IVyJbD6Kko/w1152-h852-no/get_put_clip.gif)

kill & pkill via z-shell:
![kill & pkill via z-shell](https://lh3.googleusercontent.com/-ybTtj7nmPYE/VBaLq1jyi8I/AAAAAAAAEq4/3BBEnPf4b7Q/w1152-h852-no/kill.gif)

grep & ack:
![grep & ack](https://lh6.googleusercontent.com/-dHkQzH_XD8o/VBaLq9WbSyI/AAAAAAAAEqs/II7LEMtvGwU/w1152-h852-no/grep.gif)

git via z-shell:
![git via z-shell](https://lh6.googleusercontent.com/-ATRuQsKRgFM/VBaLqQaZFEI/AAAAAAAAEqo/zoJXy-SKBHQ/w1152-h852-no/git.gif)

optimized "ls"-aliases:
![optimized "ls"-aliases](https://lh5.googleusercontent.com/-jzLOw-vkD-o/VBaLrUAwvoI/AAAAAAAAEq8/p8sOULfTuOA/w1152-h852-no/ls.gif)

"vim" » jump to last position:
!["vim" » jump to last position](https://lh5.googleusercontent.com/-6H2Y0Ratyxw/VBaLthchGDI/AAAAAAAAEro/9YETpn0GNss/w1152-h852-no/vim_v1.gif)

"vim" » quick search via "<#>" or "*":
!["vim" » quick search via "<#>" or "*"](https://lh4.googleusercontent.com/-29Wytj4-zGM/VBaLs_vT28I/AAAAAAAAElQ/qgnYpvc1SII/w1152-h852-no/vim_v2.gif)

vim » highlight trailing spaces in annoying red:
!["vim" » highlight trailing spaces in annoying red](https://lh4.googleusercontent.com/-zul98tm1cTU/VBaLt6t7ObI/AAAAAAAAErs/B7mv08W4OZs/w1152-h852-no/vim_v4.gif)

vim » "tabs" & "file-view":
!["vim" » "tabs" & "file-view"](https://lh4.googleusercontent.com/-phXE_PZUeSQ/VBaLuKlwPuI/AAAAAAAAEr4/qUVwnMmJmGI/w1152-h852-no/vim_v5.gif)

vim » tab-completion: (you have to switch off the "paste"-mode via <F2>)
!["vim" » tab-completion](https://lh3.googleusercontent.com/-2JrIi68Cln4/VBaLvDmvRuI/AAAAAAAAEr8/vrMVjlb0Kr8/w1152-h852-no/vim_v6.gif)


## Feedback

Suggestions/improvements
[welcome](https://github.com/voku/dotfiles/issues)!


## Thanks to…

* [DrVanScott](https://github.com/DrVanScott/) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [TuxCoder](https://github.com/TuxCoder/) and his [dotfiles repository](https://github.com/tuxcoder/dotfiles)
* [Mathias Bynens](https://github.com/mathiasbynens/) and his awesome [dotfiles repository](https://github.com/mathiasbynens/dotfiles/)
* [@ptb and his _OS X Lion Setup_ repository](https://github.com/ptb/Mac-OS-X-Lion-Setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
* [Cãtãlin Mariş](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](http://sindresorhus.com/)
* [Tom Ryder](http://blog.sanctum.geek.nz/) and his [dotfiles repository](https://github.com/tejr/dotfiles)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [OSXDefaults project](https://github.com/kevinSuttle/OSXDefaults)
* [Haralan Dobrev](http://hkdobrev.com/)

* anyone who [contributed a patch](https://github.com/voku/dotfiles/contributors) or [made a helpful suggestion](https://waffle.io/voku/dotfiles)
