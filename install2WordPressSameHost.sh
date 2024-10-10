#https://edvaldoguimaraes.com.br/2024/10/04/two-separate-wordpress-sites-on-the-same-ubuntu-server-with-apache2-mysql-and-php-8-3/

sudo apt update
sudo apt upgrade
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2
sudo apt install mysql-server
sudo mysql_secure_installation	
sudo mysql

CREATE DATABASE wp_site1;
CREATE USER 'wp_user1'@'localhost' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON wp_site1.* TO 'wp_user1'@'localhost';
FLUSH PRIVILEGES;
 
CREATE DATABASE wp_site2;
CREATE USER 'wp_user2'@'localhost' IDENTIFIED BY 'password2';
GRANT ALL PRIVILEGES ON wp_site2.* TO 'wp_user2'@'localhost';
FLUSH PRIVILEGES;
 
EXIT;

sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.3 libapache2-mod-php8.3 php8.3-mysql php8.3-xml php8.3-gd php8.3-curl php8.3-mbstring php8.3-zip php8.3-intl

php -v
sudo mkdir -p /var/www/site1.com
sudo mkdir -p /var/www/site2.com
sudo chown -R www-data:www-data /var/www/site1.com
sudo chown -R www-data:www-data /var/www/site2.com
sudo chmod -R 755 /var/www/site1.com
sudo chmod -R 755 /var/www/site2.com
sudo nano /etc/apache2/sites-available/site1.com.conf

<VirtualHost *:80>
    ServerAdmin admin@site1.com
    ServerName site1.com
    ServerAlias www.site1.com
    DocumentRoot /var/www/site1.com
 
    <Directory /var/www/site1.com>
        AllowOverride All
    </Directory>
 
    ErrorLog ${APACHE_LOG_DIR}/site1.com_error.log
    CustomLog ${APACHE_LOG_DIR}/site1.com_access.log combined
</VirtualHost>

	
sudo nano /etc/apache2/sites-available/site2.com.conf

<VirtualHost *:80>
    ServerAdmin admin@site2.com
    ServerName site2.com
    ServerAlias www.site2.com
    DocumentRoot /var/www/site2.com
 
    <Directory /var/www/site2.com>
        AllowOverride All
    </Directory>
 
    ErrorLog ${APACHE_LOG_DIR}/site2.com_error.log
    CustomLog ${APACHE_LOG_DIR}/site2.com_access.log combined
</VirtualHost>

sudo a2ensite site1.com.conf
sudo a2ensite site2.com.conf

sudo a2dissite 000-default.conf

sudo systemctl reload apache2

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz

sudo cp -r wordpress/* /var/www/site1.com/

sudo cp -r wordpress/* /var/www/site2.com/

sudo chown -R www-data:www-data /var/www/site1.com
sudo chown -R www-data:www-data /var/www/site2.com
sudo chmod -R 755 /var/www/site1.com
sudo chmod -R 755 /var/www/site2.com

sudo nano wp-config.php

Modify these lines:

1
2
3
4
define( 'DB_NAME', 'wp_site1' );
define( 'DB_USER', 'wp_user1' );
define( 'DB_PASSWORD', 'password1' );
define( 'DB_HOST', 'localhost' );
Repeat the process for site2.com:

1
2
3
cd /var/www/site2.com
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
Modify it to match the wp_site2 database settings:

1
2
3
4
define( 'DB_NAME', 'wp_site2' );
define( 'DB_USER', 'wp_user2' );
define( 'DB_PASSWORD', 'password2' );
define( 'DB_HOST', 'localhost' );

sudo a2enmod rewrite
sudo systemctl restart apache2
