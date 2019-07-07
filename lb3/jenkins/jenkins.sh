#!/bin/bash

cd /vagrant/microservice
sudo docker build -t jenkins .
sudo docker run -d --name jenkins -p 8080:8080 --rm -v /var/run/docker.sock -v /vagrant:/vagrant   jenkins

