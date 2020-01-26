sudo glxinfo | grep "OpenGL version"
glxinfo | grep '^direct rendering:'
lspci | grep VGA
sudo add-apt-repository ppa:ubuntu-x-swat/updates
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get dist-upgrade
glxinfo | grep "OpenGL version"
sudo apt-get install ppa-purge && sudo ppa-purge ppa:ubuntu-x-swat/updates
