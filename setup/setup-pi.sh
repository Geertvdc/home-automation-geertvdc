#docker run -d --name="home-assistant" -v /home/pi/home-assistant/config:/config -v /etc/localtime:/etc/localtime:ro --net=host homeassistant/raspberrypi3-homeassistant

#install docker
curl -ssl https://get.docker.com | sh

sudo usermod -a -G docker $USER

#install docker-compose
sudo apt-get -y install python-pip

sudo pip install docker-compose

#install git 
sudo apt-get update

sudo apt-get install git