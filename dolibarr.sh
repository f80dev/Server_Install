apt-get update && apt-get upgrade

#Installation de webmin
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python -Y
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.900_all.deb
sudo dpkg --install webmin_1.900_all.deb
rm webmin_1.900_all.deb

#Installation de dolydeb
wget https://sourceforge.net/projects/dolibarr/files/Dolibarr%20installer%20for%20Debian-Ubuntu%20%28DoliDeb%29/10.0.0/dolibarr_10.0.0-4_all.deb
apt-get install mime-support
dpkg -i dolibarr_10.0.0-4_all.deb


#Installation manuel
cd /root
wget https://sourceforge.net/projects/dolibarr/files/Dolibarr%20ERP-CRM/10.0.0/dolibarr-10.0.0.zip
unzip dolibarr-10.0.0.zip
sudo mkdir /var/www/html/dolibarr
sudo cp -r dolibarr-10.0.0/htdocs/* /var/www/html/dolibarr/
sudo chown -R www-data:www-data /var/www/html/dolibarr/
sudo chmod -R 755 /var/www/html/dolibarr/

mkdir /var/documents
chown www-data:www-data /var/documents
chmod 700 /var/documents

sudo nano /etc/apache2/sites-available/dolibarr.conf

sudo a2ensite dolibarr
sudo a2enmod rewrite
sudo systemctl restart apache2
