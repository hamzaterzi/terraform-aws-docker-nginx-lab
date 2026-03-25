#!/bin/bash
apt update -y
apt install docker.io -y
systemctl start docker
systemctl enable docker

docker run -d -p 80:80 nginx
