docker run \
   -d \
   -v $(pwd)/data:/app/data \
   --device=/dev/ttyACM0 \
   koenkk/zigbee2mqtt:1.0.1-arm32v6