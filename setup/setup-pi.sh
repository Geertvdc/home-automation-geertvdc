#docker run -d --name="home-assistant" -v /home/pi/home-assistant/config:/config -v /etc/localtime:/etc/localtime:ro --net=host homeassistant/raspberrypi3-homeassistant

#install docker
curl -ssl https://get.docker.com | sh

sudo usermod -a -G docker $USER
sudo gpasswd -a $USER docker

newgrp docker

#install docker-compose
sudo apt-get -y install python-pip

sudo pip install docker-compose

#setup docker-compose network

docker network create traefik_proxy

#install git 
sudo apt-get update

sudo apt-get install git

mkdir azure-devops-agent

curl https://vstsagentpackage.azureedge.net/agent/2.144.0/vsts-agent-linux-arm-2.144.0.tar.gz --output vsts-agent-linux-arm-2.144.0.tar.gz

tar zxvf vsts-agent-linux-arm-2.144.0.tar.gz