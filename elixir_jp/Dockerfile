##
# erlang 23.1ベースでelixir 1.11
#
##
FROM erlang:23.1-alpine
MAINTAINER Coneyware

ENV ELIXIR_BRANCH="v1.11" \
    LC_ALL=ja_JP.UTF-8 \
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
	TZ=Asia/Tokyo
RUN set -x \
 && apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual=build-dependencies \
   make \
   tzdata \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && apk add --update --no-cache \
   bash \
   git \
 && cd /root \
 && git clone -b $ELIXIR_BRANCH https://github.com/elixir-lang/elixir.git \
 && cd elixir/ \
 && make clean install \
 && cd .. \
 && rm -R /root/elixir \
 && mix local.hex --force \
 && apk del --purge build-dependencies

