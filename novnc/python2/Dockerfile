FROM alpine
MAINTAINER  Coneyware
# docker run -it --rm -e PORT=6080 -e VNC_HOST=xxxx -p 6080:6080 coneyware/novnc
#
# タイムゾーン設定
# apk add tzdata
# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# ※ タイムゾーン必要な分だけコピーしたら、あとは消す
#
ENV PORT=6080 \
    VNC_HOST=localhost \
    VNC_PORT=5900
RUN set -x \
 && apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual=build-dependencies \
   build-base \
   tzdata \
   git \
   py-pip \
   python2-dev \
 && apk add --update --no-cache \
   python2 \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && git clone --depth 1 https://github.com/novnc/noVNC.git /root/noVNC \
 && git clone --depth 1 https://github.com/novnc/websockify /root/noVNC/utils/websockify \
 && pip install numpy \
 && rm -rf /root/.cache/pip \
 && rm -r /root/noVNC/.git \
 && rm -r /root/noVNC/utils/websockify/.git \
 && sed -i -e 's/bash/ash/g' /root/noVNC/utils/launch.sh \
 && sed -i -e 's/ps -p/ps -o pid | grep/g' /root/noVNC/utils/launch.sh \
 && apk del --purge build-dependencies \
 && echo '#!/bin/ash' > /root/entry.sh \
 && echo '/root/noVNC/utils/launch.sh --listen $PORT --vnc $VNC_HOST':'$VNC_PORT $@'>> /root/entry.sh \
 && chmod +x /root/entry.sh
EXPOSE 6080
ENTRYPOINT ["/root/entry.sh"]
