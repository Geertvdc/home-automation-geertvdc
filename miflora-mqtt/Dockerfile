FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get install -y git python3 python3-pip bluetooth bluez usbutils
RUN git clone https://github.com/ThomDietrich/miflora-mqtt-daemon.git && \
    cd miflora-mqtt-daemon && \
    pip3 install -r requirements.txt
VOLUME /miflora-mqtt-daemon/config.ini
WORKDIR /miflora-mqtt-daemon
ENTRYPOINT ["python3", "miflora-mqtt-daemon.py"]