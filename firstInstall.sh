#!/bin/bash

ask_install()
{
  echo ""
  echo ""
  read -p"$1 (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 1
  else
    return 0
  fi
}

# use aptitude in the next steps ...
if [ \! -f $(whereis aptitude | cut -f 2 -d ' ') ] ; then
  sudo apt-get install aptitude
fi

# update && upgrade
ask_install "upgrade your system?"
if [[ $? -eq 1 ]]; then
  sudo aptitude update
  sudo aptitude upgrade
fi

# install default-stuff
sudo aptitude install \
  `# read-write NTFS driver for Linux` \
  ntfs-3g \
  `# do not delete main-system-dirs` \
  safe-rm \
  `# default for many other things` \
  tmux \
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
  optipng \
  pngcrush \
  jpegoptim \
  libjpeg-progs \
  `# utilities` \
  coreutils  \
  moreutils \
  findutils  \
  colordiff \
  ack-grep \
  ngrep \
  atop \
  tree \
  rsync \
  vim \
  csstidy \
  recode \
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
  ttf-liberation \
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
  `# nstall python-pygments for json print` \
  python-pygments \
  locales \
  sysstat \
  htop


#
# install java / ubuntu
#

#sudo add-apt-repository -y ppa:nilarimogard/webupd8
#sudo add-apt-repository -y ppa:webupd8team/java
#sudo aptitude update
#sudo aptitude install oracle-java7-installer

#
# install java / debian
#

#su -
#echo "deb http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8.list
#echo "deb-src http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu precise main" | tee -a /etc/apt/sources.d/webupd8.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4C9D234C
#
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.d/webupd8team-java.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
#aptitude update
#aptitude install oracle-java7-installer
#exit


#
# install new git / ubuntu
#

#sudo add-apt-repository -y ppa:git-core/ppa
#sudo aptitude update
#sudo aptitude upgrade git

#
# install new git / debian
#

#su -
#echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu precise main" | tee /etc/apt/sources.list.d/git-core.list
#echo "deb-src http://ppa.launchpad.net/git-core/ppa/ubuntu precise main" | tee -a /etc/apt/sources.d/git-core.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E1DF1F24
#aptitude update
#aptitude upgrade git
#exit


#
# install Sublime Text 3
#

#sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
#sudo aptitude update
#sudo aptitude install sublime-text-installer
#sudo ln -sf /opt/sublime_text/sublime_text /usr/local/bin/sublime


#
# install node.js without deb-files e.g. for Debian - stable
#

#curl https://www.npmjs.org/install.sh | sudo sh


#
# only for webworker
#

ask_install "install webworker tools"
if [[ $? -eq 1 ]]; then
  sudo gem install sass --pre
  sudo gem install compass --pre
  sudo gem install autoprefixer-rails --pre
  sudo gem install compass-rgbapng --pre
  sudo gem install oily_png

  sudo npm install -g bower
  sudo npm install -g psi
  sudo npm install -g grunt-cli
  sudo npm install -g grunt-init
  sudo npm install -g yo

  sudo aptitude install php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcached php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xdebug php5-apcu php5-geoip
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin
  sudo ln -s /usr/bin/composer.phar /usr/bin/composer
fi

# clean downloaded and already installed packages
sudo aptitude clean

# update-fonts
sudo cp -vr ~/dotfiles/.fonts/* /usr/share/fonts/truetype/
sudo dpkg-reconfigure fontconfig
sudo fc-cache -fv

# update-locate-db
sudo updatedb

