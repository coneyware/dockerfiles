FROM alpine
MAINTAINER  Coneyware
# docker run -it --rm -p 6080:6080 -p 4444:4444 -v mount:/root/mount xxx /root/entry.sh
#
# タイムゾーン設定
# apk add tzdata
# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# ※ タイムゾーン必要な分だけコピーしたら、あとは消す
# 
#  noVnc
#   procps は必要（ps -pがbusyboxだけではエラーになる）
#
COPY home /root
RUN set -x \
 && apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual=build-dependencies \
   tzdata \
   git \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && apk add --update --no-cache \
   bash \
   procps \
   python2 \
 && git clone --depth 1 https://github.com/novnc/noVNC.git /root/noVNC \
 && git clone --depth 1 https://github.com/novnc/websockify /root/noVNC/utils/websockify \
 && chmod +x /root/entry.sh \
 && rm -r /root/noVNC/.git \
 && rm -r /root/noVNC/utils/websockify/.git \
 && apk del --purge build-dependencies
ENV PORT=6080 \
    VNC_HOST=localhost \
    VNC_PORT=5900
EXPOSE 6080
ENTRYPOINT ["/root/entry.sh"]
