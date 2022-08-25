# installing docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# setting permission to make binary executable
sudo chmod +x /usr/local/bin/docker-compose

# check the docker-compose version
docker-compose --version