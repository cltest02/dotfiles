#!/bin/bash

function ask_install() {
  echo
  echo
  read -p"$1 (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 1
  else
    return 0
  fi

}


# use aptitude in the next steps ...
if [ \! -f `whereis aptitude | cut -f 2 -d ' '` ] ; then
  sudo apt-get install aptitude
fi

# update && upgrade 
sudo aptitude update
sudo aptitude upgrade

sudo aptitude install \
  `# read-write NTFS driver for Linux` \
  ntfs-3g \
  `# do not delete main-system-dirs` \
  safe-rm \
  `# default for many other things` \
  build-essential \
  mktemp \
  dialog \
  `# unzip, unrar etc.` \
  cabextract \
  zip \
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
  xz-utils \
  `# optimize image-size` \
  gifsicle \
  svgo \
  optipng \
  pngcrush \
  jpegoptim \
  libjpeg-progs \
  `# utilities` \
  coreutils  \
  findutils  \
  colordiff \
  moreutils \
  atop \
  tree \
  rsync \
  vim \
  csstidy \
  `# GNU bash` \
  bash \
  bash-completion \
  `# command line clipboard` \
  xclip \
  `# more colors in the shell` \
  grc \
  `# fonts also "non-free"-fonts` \
  `# -- you need "multiverse" || "non-free" sources in your "source.list" -- ` \
  ttf-freefont \
  ttf-mscorefonts-installer \
  ttf-bitstream-vera \
  ttf-dejavu \
  ttf-liberation \
  ttf-linux-libertine \
  ttf-larabie-deco \
  ttf-larabie-straight \
  ttf-larabie-uncommon \
  msttcorefonts \
  `# trace everything` \
  strace \
  `# get files from web` \
  wget \
  curl \
  `# repo-tools`\
  git \
  subversion \
  mercurial \
  `# usefull tools` \
  nodejs \
  ruby-full \
  imagemagick \
  lynx \
  nmap \
  pv \
  rename \
  ucspi-tcp \
  xpdf \
  python-pygments \ #install python-pygments for json print

#
# install java
#

#su -
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
#aptitude update
#aptitude install oracle-java7-installer
#exit

# 
# install node.js without deb-files e.g. for Debian - stable
#

#curl https://www.npmjs.org/install.sh | sudo sh

#
# only for webworker
#

ask_install "install webworker tools"
if [[ $? -eq 1 ]]; then
  sudo gem install sass
  sudo gem install compass
  sudo gem install autoprefixer-rails
  
  sudo npm install -g bower
  sudo npm install -g psi
  sudo npm install -g grunt-cli
  sudo npm install -g grunt-init
  sudo npm install -g yo

  sudo aptitude install php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xdebug php5-apcu
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin
  sudo ln -s /usr/bin/composer.phar /usr/bin/composer
fi


# clean downloaded and already installed packages
sudo aptitude clean

# update-fonts
sudo dpkg-reconfigure fontconfig                                                                       
sudo fc-cache -fv

# update-locate-db
sudo updatedb
