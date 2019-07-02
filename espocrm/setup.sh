cd /root
git clone https://github.com/peters5/docker-espocrm.git

mkdir /var/www
mkdir /var/www/espocrm
mkdir /var/www/espocrm/data
cd /var/www/espocrm
find data -type d -exec chmod 775 {} + && chown -R 100:101 .

cd /root/docker-espocrm
docker build -t "espocrm" .
docker-compose up

echo "ouvrir http://localhost:10081/install"
