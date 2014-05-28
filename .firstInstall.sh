# update
sudo apt-get update
sudo apt-get upgrade

# sudo apt-get install GNU core utilities
sudo apt-get install coreutils
# sudo apt-get install some other useful utilities like
sudo apt-get install moreutils
# sudo apt-get install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
sudo apt-get install findutils
sudo updatedb

sudo apt-get install bash bash-completion

# sudo apt-get install wget / curl
sudo apt-get install wget curl

# sudo apt-get install node.js
# Debian
curl https://www.npmjs.org/install.sh | sudo sh
# Ubuntu
sudo apt-get install nodejs

# sudo apt-get install more recent versions of some OS X tools
sudo apt-get install vim

sudo apt-get install git
sudo apt-get install imagemagick
sudo apt-get install lynx
sudo apt-get install nmap
sudo apt-get install p7zip
sudo apt-get install pigz
sudo apt-get install pv
sudo apt-get install rename
sudo apt-get install sqlmap
sudo apt-get install tree
sudo apt-get install ucspi-tcp # `tcpserver` et al.
sudo apt-get install webkit2png
sudo apt-get install xpdf

# Remove outdated versions from the cellar
sudo apt-get clean
