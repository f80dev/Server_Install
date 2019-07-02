cd /root
git clone https://github.com/peters5/docker-espocrm.git

cd docker-espocrm
docker build -t "espocrm" .
docker-compose up

echo "ouvrir http://localhost:10081/install"
