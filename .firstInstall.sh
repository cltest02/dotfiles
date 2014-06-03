#!/bin/bash

# use aptitude in the next steps ...
if [ \! -f `whereis aptitude | cut -f 2 -d ' '` ] ; then
  sudo apt-get install aptitude
fi

# update
sudo aptitude update
sudo aptitude upgrade

# read-write NTFS driver for Linux
sudo aptitude install ntfs-3g

# do not delete main--system-dirs (e.g.: "/", "/bin/, /boot/, ...)
sudo aptitude install safe-rm

# default for many other things
sudo aptitude install build-essential \
                      mktemp \
                      dialog \
                      cabextract

# unzip, unrar etc.
sudo aptitude install zip \
                      unzip \
                      rar \
                      unrar \
                      tar \
                      pigz \
                      p7zip \
                      p7zip-full \
                      p7zip-rar \
                      unace \
                      bzip2 \
                      gzip \
                      xz-utils

# install GNU core utilities
sudo aptitude install coreutils colordiff
# install some other useful utilities
sudo aptitude install moreutils rsync
# install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
sudo aptitude install findutils
sudo updatedb

sudo aptitude install bash bash-completion

# add extra fonts
# 
# also "non-free"-fonts -> 
#   so you need "multiverse" || "non-free" sources in your "source.list"
sudo aptitude install ttf-freefont \
                      ttf-mscorefonts-installer \
                      ttf-bitstream-vera \
                      ttf-dejavu \
                      ttf-liberation \
                      ttf-linux-libertine \
                      ttf-larabie-deco \
                      ttf-larabie-straight \
                      ttf-larabie-uncommon \
                      ttf-droid \
                      msttcorefonts

sudo dpkg-reconfigure fontconfig 
sudo fc-cache -fv

# trace everything
sudo aptitude install strace

# more colors
sudo aptitude install grc

# install wget / curl
sudo aptitude install wget curl

# install java
#su -
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
#aptitude update
#aptitude install oracle-java7-installer
#exit

# install node.js
# Debian
curl https://www.npmjs.org/install.sh | sudo sh
# Ubuntu / Debian - sid
sudo aptitude install nodejs

# install usefull tools
sudo aptitude install vim
sudo aptitude install git
sudo aptitude install ruby-full
sudo aptitude install imagemagick
sudo aptitude install lynx
sudo aptitude install nmap
sudo aptitude install pv
sudo aptitude install rename
sudo aptitude install sqlmap
sudo aptitude install tree
sudo aptitude install ucspi-tcp
sudo aptitude install webkit2png
sudo aptitude install xpdf

#
# only for webworker
#

#sudo gem install sass
#sudo gem install compass
#sudo gem install autoprefixer-rails

#sudo npm install -g bower
#sudo npm install -g grunt-cli
#sudo npm install -g grunt-init
#sudo npm install -g yo

#sudo aptitude install apache2 libapache2-mod-php5 php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xdebug php5-apcu
#curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin

# clean downloaded and already installed packages
sudo aptitude clean
