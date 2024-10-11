# Step 1: Allow MySQL to listen on all interfaces
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# Change bind-address to:
bind-address = 0.0.0.0
sudo systemctl restart mysql
 
# Step 2: Grant remote access to a MySQL user
sudo mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
 
# Step 3: Allow MySQL port 3306 through the firewall
# For Ubuntu/Debian:
sudo ufw allow 3306/tcp
# For CentOS/RedHat:
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

UPDATE wp_users SET user_pass = MD5('new_password') WHERE user_login = 'username';
