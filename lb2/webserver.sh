#!/bin/bash

#Debug on
set -o xtrace

#updates holen und upgrade durchführen
sudo apt-get update && upgrade

#webserver installieren
sudo apt-get -y install apache2

#firewall installieren
sudo apt-get -y install ufw

#firewall starten
sudo ufw --force enable

#Port 80 öffnen für alle
sudo ufw allow 80/tcp

#Port 22 öffnen für alle
sudo ufw allow 22/tcp

#Proxserver einrichten
sudo apt-get -y install apache2-bin libxml2-dev
sudo service apache2 restart
sudo a2enmod proxy
sudo service apache2 restart
sudo a2enmod proxy_html
sud service apache2 restart
sudo a2enmod proxy_http

echo "ServerName localhost" >> /etc/apache2/apache2.conf

sudo service apache2 restart

sudo rm /etc/apache2/sites-available/000-default.conf
sudo touch /etc/apache2/sites-available/000-default.conf
cat >> /etc/apache2/sites-available/000-default.conf<<EOL
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        <Directory /var/www/html/>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        <IfModule mod_dir.c>
            DirectoryIndex index.php index.pl index.cgi index.html index.xhtml index.htm
        </IfModule>
		    # Allgemeine Proxy Einstellungen
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    # Weiterleitungen master
    ProxyPass /master http://master
    ProxyPassReverse /master http://master

</VirtualHost>
EOL

sudo service apache2 restart

#Neuer Benutzer erstellen mit Home-Directory
sudo useradd -m oscar
#Neue Gruppe erstellen
sudo addgroup --gid 2000 standard_group
#Benutzer Gruppe hinzufügen
sudo usermod -aG standard_group oscar


