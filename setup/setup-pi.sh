#basic install is default raspbian image
#next steps manual:

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

#on non portainer pi set the docker daemon to be available over tcp so it can be controlled by portainer.
#create a file in /etc/systemd/system/docker.service.d/override.conf
#add following
--
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:// -H tcp://0.0.0.0:2376
--

#restart docker daemon. after that you can add machine to portainer by adding the ip:2376
sudo systemctl daemon-reload
sudo systemctl restart docker.service