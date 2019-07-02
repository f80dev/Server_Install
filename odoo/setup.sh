cd /root
mkdir odoo
cd odoo
wget https://raw.githubusercontent.com/odoo/docker/master/12.0/entrypoint.sh
sh entrypoint.sh

wget https://raw.githubusercontent.com/odoo/docker/master/12.0/odoo.conf
mkdir /var/lib/odoo

docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name db postgres:10
docker run -v /root/odoo:/etc/odoo -p 8069:8069 --name odoo --link db:db -t odoo
