FROM        alpine:3.12.1

COPY 			start.sh /start.sh

RUN         apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted

ENTRYPOINT  sh start.sh