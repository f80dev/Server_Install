#!/usr/bin/env bash

cd /root
rm -r -f /opt/bitnami
mkdir /opt/bitnami
mkdir /opt/bitnami/mariadb_data
mkdir /opt/bitnami/suitecrm_data

mkdir /etc/nginx
mkdir /etc/nginx/certs
mkdir /etc/nginx/vhost.d
mkdir /usr/share/nginx
mkdir /usr/share/nginx/html

#voir https://techoverflow.net/2018/12/15/solving-bitnam-docker-redmine-cannot-create-directory-bitnami-mariadb-permission-denied/
sudo chown -R 1001:1001 /opt/bitnami/mariadb_data
sudo chown -R 1001:1001 /opt/bitnami/suitecrm_data

#Téléchargement du fichier
wget https://raw.githubusercontent.com/f80dev/SuiteCRM_install/master/docker-compose.yml
nano docker-compose.yml
