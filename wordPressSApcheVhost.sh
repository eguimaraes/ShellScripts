#Here’s a summary of all the command-line steps to deploy multiple WordPress sites under a single Apache virtual host:

### **1. Update System**
```bash
sudo apt update
sudo apt upgrade
```

### **2. Install Apache2**
```bash
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
```

### **3. Install MySQL**
```bash
sudo apt install mysql-server
sudo mysql_secure_installation
```

#### **Create Databases and Users for WordPress Sites**
```bash
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
```

### **4. Install PHP 8.3 and Required Extensions**
```bash
sudo apt install php8.3 libapache2-mod-php8.3 php8.3-mysql php8.3-xml php8.3-gd php8.3-curl php8.3-mbstring php8.3-zip php8.3-intl
php -v
```

### **5. Configure Apache Virtual Host**
```bash
sudo nano /etc/apache2/sites-available/site.com.conf
```

Add the following content:

```apache
<VirtualHost *:80>
    ServerAdmin admin@site.com
    ServerName site.com
    DocumentRoot /var/www/site.com

    <Directory /var/www/site.com>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/site.com_error.log
    CustomLog ${APACHE_LOG_DIR}/site.com_access.log combined
</VirtualHost>
```

#### **Enable the Virtual Host**
```bash
sudo a2ensite site.com.conf
sudo a2dissite 000-default.conf
sudo systemctl reload apache2
```

### **6. Create Directory Structure for WordPress Sites**
```bash
sudo mkdir -p /var/www/site.com/site1
sudo mkdir -p /var/www/site.com/site2
```

### **7. Download and Install WordPress**
```bash
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
```

#### **Copy WordPress Files to Each Subdirectory**
```bash
sudo cp -r wordpress/* /var/www/site.com/site1/
sudo cp -r wordpress/* /var/www/site.com/site2/
```

#### **Set Correct Permissions**
```bash
sudo chown -R www-data:www-data /var/www/site.com/site1
sudo chown -R www-data:www-data /var/www/site.com/site2
sudo chmod -R 755 /var/www/site.com/site1
sudo chmod -R 755 /var/www/site.com/site2
```

### **8. Configure WordPress Instances**

#### **Configure wp-config.php for Site 1**
```bash
cd /var/www/site.com/site1
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
```

Change database settings:

```php
define( 'DB_NAME', 'wp_site1' );
define( 'DB_USER', 'wp_user1' );
define( 'DB_PASSWORD', 'password1' );
define( 'DB_HOST', 'localhost' );
```

#### **Configure wp-config.php for Site 2**
```bash
cd /var/www/site.com/site2
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
```

Change database settings:

```php
define( 'DB_NAME', 'wp_site2' );
define( 'DB_USER', 'wp_user2' );
define( 'DB_PASSWORD', 'password2' );
define( 'DB_HOST', 'localhost' );
```

### **9. Enable Apache Rewrite Module**
```bash
sudo a2enmod rewrite
sudo systemctl restart apache2
```

### **10. Install Let’s Encrypt SSL (Optional)**
```bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache -d site.com
sudo systemctl reload apache2
```

