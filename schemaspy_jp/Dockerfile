FROM openjdk:8-jre-alpine
MAINTAINER  Coneyware
#
# タイムゾーン設定
# apk add tzdata
# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# ※ タイムゾーン必要な分だけコピーしたら、あとは消す
#
ENV SCHEMASPY_VERSION="6.0.0" \
    LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8 \
	LANGUAGE=ja_JP:ja \
	TZ=Asia/Tokyo
RUN set -x \
 && apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual=build-dependencies \
   curl \
   build-base \
   tzdata \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && apk add --update --no-cache \
   bash \
   graphviz \
   procps \
 && mkdir /drivers \
 && mkdir /output \
 && mkdir /usr/local/lib/schemaspy \
 && cd /usr/local/lib/schemaspy \
 && curl -LO https://github.com/schemaspy/schemaspy/releases/download/v$SCHEMASPY_VERSION/schemaspy-$SCHEMASPY_VERSION.jar \
 && adduser -D schemaspy \
 && echo 'schemaspy:schemaspy' | chpasswd \
 && chown -R schemaspy /drivers \
 && chown -R schemaspy /output \
 && apk del --purge build-dependencies

COPY home /home/schemaspy

RUN chmod +x /home/schemaspy/schemaspy.sh

USER schemaspy
WORKDIR /home/schemaspy
ENV SCHEMASPY_DRIVERS=/drivers
ENV SCHEMASPY_OUTPUT=/output

ENTRYPOINT ["/home/schemaspy/schemaspy.sh"]
