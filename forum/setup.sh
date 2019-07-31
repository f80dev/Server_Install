echo "Create SMF Database"

sudo mysql -u root -p
DROP DATABASE smf;
CREATE DATABASE smf;
CREATE USER 'smfuser'@'localhost' IDENTIFIED BY 'hh4271';
GRANT ALL ON smf.* TO 'smfuser'@'localhost' IDENTIFIED BY 'hh4271' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

cd /tmp && wget https://download.simplemachines.org/index.php/smf_2-1-rc2_install.zip
sudo mkdir -p /var/www/html/smf
sudo unzip smf_2-1-rc2_install.zip -d /var/www/html/smf

sudo chown -R www-data:www-data /var/www/html/smf/
sudo chmod -R 755 /var/www/html/smf/

sudo nano /etc/apache2/sites-available/smf.conf

#rédiger :
<VirtualHost *:80>
     ServerAdmin admin@mysmf.com
     DocumentRoot /var/www/html/smf
     ServerName f80.fr
     ServerAlias forum.f80.fr

     <Directory /var/www/html/smf/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

sudo a2ensite smf.conf
sudo a2enmod rewrite

sudo systemctl restart apache2.service

