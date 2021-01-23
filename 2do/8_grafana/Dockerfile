FROM        alpine:3.12.1

RUN         apk add \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
            grafana

ENTRYPOINT  grafana-server -config "etc/grafana.ini" -homepath "usr/share/grafana"
