#!/bin/bash
cd /vagrant/microservice
sudo docker build -t hello_world .
sudo docker run -d --name hello_world -p 8081:8081 --rm -v /var/run/docker.sock -v /vagrant:/vagrant   hello_world

