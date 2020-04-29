FROM alpine
MAINTAINER  Coneyware
# docker run -it --rm -e PORT=6080 -p 6080:6080
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
ENV PORT=6080 \
    VNC_HOST=localhost \
    VNC_PORT=5900
RUN set -x \
 && apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual=build-dependencies \
   build-base \
   python3-dev \
   tzdata \
   git \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && apk add --update --no-cache \
   procps \
   python3 \
 && git clone --depth 1 https://github.com/novnc/noVNC.git /root/noVNC \
 && pip3 install websockify \
 && rm -rf /root/.cache/pip \
 && chmod +x /root/entry.sh \
 && rm -r /root/noVNC/.git \
 && apk del --purge build-dependencies
EXPOSE 6080
ENTRYPOINT ["/root/entry.sh"]
