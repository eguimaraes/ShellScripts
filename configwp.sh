#https://edvaldoguimaraes.com.br/2024/10/04/two-separate-wordpress-sites-on-the-same-ubuntu-server-with-apache2-mysql-and-php-8-3/
cd /var/www/site2.com
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
sudo a2enmod rewrite
sudo systemctl restart apache2