#!/bin/bash
docker run -d --net=host --volume ./config.livingroom.ini:/miflora-mqtt-daemon/config.ini --name miflora --restart always geertvdc/miflora-mqtt