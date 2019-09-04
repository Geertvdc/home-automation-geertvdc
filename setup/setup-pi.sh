#basic install is default raspbian image
#next steps manual:

#install docker
# Install some required packages first
sudo apt update
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Get the Docker signing key for packages
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Add the Docker official repos
echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Install Docker
# The aufs package, part of the "recommended" packages, won't install on Buster just yet, because of missing pre-compiled kernel modules.
# We can work around that issue by using "--no-install-recommends"
sudo apt update
sudo apt install -y --no-install-recommends \
    docker-ce \
    cgroupfs-mount

#setup docker-compose network

sudo systemctl enable docker
sudo systemctl start docker

docker network create traefik_proxy

#docker-compose 

# Install required packages
sudo apt update
sudo apt install -y python python-pip libffi-dev python-backports.ssl-match-hostname

# Install Docker Compose from pip
# This might take a while
sudo pip install docker-compose

#install git 
sudo apt-get update

sudo apt-get install git

mkdir azure-devops-agent

curl https://vstsagentpackage.azureedge.net/agent/2.155.1/vsts-agent-linux-arm-2.155.1.tar.gz --output vsts-agent-linux-arm-2.155.1.tar.gz

curl https://dot.net/v1/dotnet-install.sh --output dotnet-install.sh

curl https://download.visualstudio.microsoft.com/download/pr/08b5ee2d-85d3-4e9a-8392-a53d9bfc45b6/8e2bc9a61074f8a82a455a0614226262/dotnet-sdk-2.1.801-linux-arm.tar.gz --output dotnet-sdk-2.1.801-linux-arm.tar.gz
 
tar zxvf ../vsts-agent-linux-arm-2.155.1.tar.gz

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