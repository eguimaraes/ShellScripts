#https://edvaldoguimaraes.com.br/2024/10/04/two-separate-wordpress-sites-on-the-same-ubuntu-server-with-apache2-mysql-and-php-8-3/
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz

sudo cp -r wordpress/* /var/www/site1.com/

sudo chown -R www-data:www-data /var/www/site1.com
sudo chown -R www-data:www-data /var/www/site2.com
sudo chmod -R 755 /var/www/site1.com
sudo chmod -R 755 /var/www/site2.com

cd /var/www/site1.com
sudo cp wp-config-sample.php wp-config.php
