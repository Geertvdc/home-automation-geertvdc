# Geertvdc's Home Automation Project
This project contains all information for the home automation project for Geert's home. 

All components of my home automation run as docker containers on Raspberry pi devices. I use Docker-Compose to manage my containers. 

## Device Setup

I currently run 2 Raspberry Pi devices which are installed with Raspbian Lite Stretch. Set up after the default Raspbian lite stretch image is described in the [setup-pi.sh](setup/setup-pi.sh) script

### Continuous delivery
todo



### Raspberry Pi devices <img src="docs/img/logo-raspberrypi.png" alt="raspberry pi" width="30"> 
* **PowerPi** - Raspberry Pi near my central fuse box of my home reading power usage
* **MediaPi** - Raspberry Pi located in my living room connected to my TV and AVR and also runs Kodi next to home automation tasks

## Container Setup

My Raspberry pi devices run several containers doing all the home automation

* **DSMR Reader** - "Dutch Smart Meter Requirements Reader" used for reading power usage in my home
* **Home Assistant** - Core of my home automation. This is the software that controls all the automation scripts for lights/temperature/devices
* **Management** - Management is a set of containers to control other containers. Traefik is used as a reverse proxy and Portainer is an app used to control and view the other containers
* **Miflora-mqtt** - Miflora is xiaomi's product with sensors you can add to a plant to monitor if it needs water or not. This works via bluetooth and this application reads the value from bluetooth and sends them to home assistant as mqtt messages
* **Zigbee2mqtt** - This is a brilliant application that turns a simple 4$ usb stick into a zigbee controller which communicates over mqtt to home assistant. More info on the application [here](https://koenkk.github.io/zigbee2mqtt/).
