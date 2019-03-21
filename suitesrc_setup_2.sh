#!/usr/bin/env bash

#Installation de suitecrm
cd /root
rm -f docker-compose.yml
docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)
docker-compose up


#fabrication des certificats
cd /opt/bitnami/suitecrm_data/apache/conf/bitnami/certs
certbot certonly --standalone -d $1 -d www.$1
openssl x509 -outform der -in /etc/letsencrypt/live/$1/cert.pem -out server.crt
openssl rsa -outform der  -in /etc/letsencrypt/live/$1/privkey.pem -out server.key

reboot

#ouvrir le browser sur http://<adresse du serveur>/index.php?module=Home&action=index
