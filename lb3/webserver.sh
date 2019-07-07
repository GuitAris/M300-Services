#!/bin/bash

#Debug on
set -o xtrace

#updates holen und upgrade durchführen
sudo apt-get -y upgrade

#docker installieren
#sudo apt-get -y install docker
#sudo apt-get -y install docker.io

#sudo docker build

#firewall installieren
sudo apt-get -y install ufw

#firewall starten
sudo ufw --force enable

#Port 80 öffnen für alle
sudo ufw allow 80/tcp

#Port 22 öffnen für alle
sudo ufw allow 22/tcp

# HTTPS
sudo ufw allow 443
#ghost
sudo ufw allow 2368

# Jenkins, Ghost, Microservice
sudo ufw allow 8080
sudo ufw allow 8082
sudo ufw allow 50000
sudo ufw allow 8081

# Allow a range of Firewall rules for Jenkins
for i in {32760..32780}
do
    sudo ufw allow $i
done

#Neuer Benutzer erstellen mit Home-Directory
sudo useradd -m oscar
#Neue Gruppe erstellen
sudo addgroup --gid 2000 standard_group
#Benutzer Gruppe hinzufügen
sudo usermod -aG standard_group oscar

