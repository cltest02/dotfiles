# background for your desktop
#gsettings set org.gnome.desktop.background draw-background false && gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/dotfiles/cli-commands.png && gsettings set org.gnome.desktop.background draw-background true

# update
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install safe-rm

# default for many other things
sudo apt-get install build-essential

# install GNU core utilities
sudo apt-get install coreutils colordiff
# install some other useful utilities
sudo apt-get install moreutils rsync
# install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
sudo apt-get install findutils
sudo updatedb

sudo apt-get install bash bash-completion

# add extra fonts - non-free
sudo apt-get install ttf-mscorefonts-installer

# trace everything
sudo apt-get install strace

# more colors
sudo apt-get install grc

# install wget / curl
sudo apt-get install wget curl

# install java
#su -
#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
#apt-get update
#apt-get install oracle-java7-installer
#exit

# install node.js
# Debian
curl https://www.npmjs.org/install.sh | sudo sh
# Ubuntu / Debian - sid
sudo apt-get install nodejs

# install more recent versions of some OS X tools
sudo apt-get install vim

sudo apt-get install git
sudo apt-get install ruby-full
sudo apt-get install imagemagick
sudo apt-get install lynx
sudo apt-get install nmap
sudo apt-get install p7zip
sudo apt-get install pigz
sudo apt-get install pv
sudo apt-get install rename
sudo apt-get install sqlmap
sudo apt-get install tree
sudo apt-get install ucspi-tcp
sudo apt-get install webkit2png
sudo apt-get install xpdf

sudo gem install sass
sudo gem install compass
sudo gem install autoprefixer-rails

sudo npm install -g bower
sudo npm install -g grunt-cli
sudo npm install -g grunt-init

#sudo apt-get install apache2 libapache2-mod-php5 php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xdebug

# curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin

# clean downloaded and already installed packages
sudo apt-get clean
