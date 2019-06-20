#Installation d'un serveur LAMP

sudo apt install ca-certificates apt-transport-https -y
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list


sudo apt install php7.2 -y
sudo apt install php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-xml -Y

sudo apt install mariadb-server mariadb-client -Y
systemctl status mariadb
sudo systemctl enable mariadb

sudo apt install apache2 apache2-utils -Y
systemctl status apache2
sudo systemctl start apache2
sudo systemctl enable apache2

sudo a2enmod php7.2
sudo systemctl restart apache2

