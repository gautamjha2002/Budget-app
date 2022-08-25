#!/bin/bash

# installing Docker on CentOS-7

# Updating system packages
sudo yum update -y

#  Uninstalling old versions of Docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Setting up the repository
sudo yum install -y yum-utils


sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Installing Docker engine
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# enabling docker so that it starts with system startup
sudo systemctl enable docker


# Staring docker
sudo systemctl start docker

# Post installation step

# add user to the docker group
sudo usermod -aG docker $USER

# activate the changes in group
newgrp docker 

# by this post installation step we can run docker without sudo

