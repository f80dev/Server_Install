#Installation d'un serveur LAMP

sudo apt install ca-certificates apt-transport-https -y
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list


sudo apt install -y php7.2
sudo apt install -y php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-xml

sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable mariadb

sudo apt install -y apache2 apache2-utils 
sudo systemctl start apache2
sudo systemctl enable apache2

sudo a2enmod php7.2
sudo systemctl restart apache2

#Creation de la base pour suiteCRM executer dans mysql
sudo mysql -u root -p
CREATE DATABASE suitecrm;
CREATE USER 'suitecrmuser'@'localhost' IDENTIFIED BY 'hh';
GRANT ALL ON suitecrm.* TO 'suitecrmuser'@'localhost' IDENTIFIED BY 'hh' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

#Installation de suiteCRM
sudo apt-get install -y git
cd /tmp && git clone https://github.com/salesagility/SuiteCRM.git suitecrm
sudo mv suitecrm /var/www/html/suitecrm/

#installation version
cd /var/www/html
sudo wget https://suitecrm.com/files/162/SuiteCRM-7.11/435/SuiteCRM-7.11.5.zip
sudo unzip SuiteCRM-7.11.5.zip -d .
sudo mv SuiteCRM-7.11.5.zip suitecrm

#Attribution des droits
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

#
cd /var/www/html/suitecrm
sudo apt-get install -y composer
sudo composer install --ignore-platform-reqs --no-dev


#Configuration d'apache
sudo nano /etc/apache2/sites-available/suitecrm.conf

<VirtualHost *:80>
     ServerAdmin admin@mysuitecrm.com
     DocumentRoot /var/www/html/suitecrm/
     ServerName crm.f80.fr
     ServerAlias crm.f80.fr

     <Directory /var/www/html/suitecrm/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


sudo a2ensite suitecrm.conf
sudo a2enmod rewrite

#Installation de lets encrypt
sudo apt-get install -y python-certbot-apache
sudo certbot --apache -m hhoareau@gmail.com -d crm.f80.fr


#Redemarage
sudo systemctl restart apache2.service






