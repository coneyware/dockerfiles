#!/bin/ash
cd /root/noVNC/utils
/root/noVNC/utils/launch.sh --listen $PORT --vnc $VNC_HOST':'$VNC_PORT $@

