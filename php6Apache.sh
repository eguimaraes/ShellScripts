#https://php.watch/articles/php-8.3-install-upgrade-on-debian-ubuntu
sudo dpkg -l | grep php | tee packages.txt
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.3 php8.3-cli php8.3-{bz2,curl,mbstring,intl}
sudo apt install php8.3-fpm
sudo a2enconf php8.3-fpm
sudo a2disconf php8.2-fpm
sudo apt purge php8.2*