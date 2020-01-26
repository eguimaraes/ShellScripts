sudo glxinfo | grep "OpenGL version"
lspci | grep VGA
sudo add-apt-repository ppa:ubuntu-x-swat/updates
sudo apt-get dist-upgrade
glxinfo | grep "OpenGL version"
sudo apt-get install ppa-purge && sudo ppa-purge ppa:ubuntu-x-swat/updates
