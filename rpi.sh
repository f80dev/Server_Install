#Installation sur la base de https://www.getopenerp.com/install-odoo-10-on-ubuntu-16-04/

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python-dateutil python-docutils python-feedparser python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi poppler-utils python-pip python-pypdf python-passlib python-decorator gcc python-dev mc bzr python-setuptools python-markupsafe python-reportlab-accel python-zsi python-yaml python-argparse python-openssl python-egenix-mxdatetime python-usb python-serial lptools make python-pydot python-psutil python-paramiko poppler-utils python-pdftools antiword python-requests python-xlsxwriter python-suds python-psycogreen python-ofxparse python-gevent
pip install setuptools
pip install pypdf
#pip install pybabel

sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css

#sudo apt-get install python-software-properties
#sudo vim /etc/apt/sources.list.d/pgdg.list
#deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql


sudo su postgres
cd
createuser -s odoo
createuser -s ubuntu_user_name
exit

sudo adduser --system --home=/opt/odoo --group odoo


cd /opt/odoo
sudo wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz
sudo tar zxvf gdata-2.0.18.tar.gz
sudo chown -R odoo: gdata-2.0.18
sudo -s
cd gdata-2.0.18/
python setup.py install
exit

echo "Install odoo"
apt-get install git
git clone --depth=1 --branch=12.0 https://github.com/odoo/odoo.git /opt/odoo/odoo
sudo mv odoo/ odoo-12.0/ 
sudo chown -R odoo: odoo-12.0

sudo cp /opt/odoo/odoo-12.0/debian/odoo.conf /etc/odoo.conf
sudo chown odoo: /etc/odoo.conf

cd /opt/odoo/odoo-12.0
./odoo-bin

echo "run http://crm.f80.fr:8069/ ou http://192.168.1.3:8069

