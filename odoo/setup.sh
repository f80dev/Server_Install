cd /root
mkdir odoo
cd odoo

mkdir /root/odoo/config
mkdir /root/odoo/addons

#wget https://raw.githubusercontent.com/odoo/docker/master/12.0/odoo.conf
#nano odoo.conf
#cp odoo.conf /root/odoo/config

#docker rm -f db
#docker rm -f odoo

docker run -d --restart=always -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name db postgres:10
docker run -v /root/odoo/addons:/mnt/extra-addons -v /root/odoo/config:/etc/odoo -p 8069:8069 --name odoo --link db:db -d --restart=always -t odoo

#docker start -a odoo

echo "lancer http://192.168.1.5:8069"
