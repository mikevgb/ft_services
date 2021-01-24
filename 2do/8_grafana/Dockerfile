FROM        alpine:3.12.1

RUN         apk add \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
            grafana

COPY        grafana.db /usr/share/grafana/data/grafana.db

ENTRYPOINT  grafana-server -config "etc/grafana.ini" -homepath "usr/share/grafana"


# backup grafana config
# kubectl cp default/PODNAME:/usr/share/grafana/data/grafana.db ./grafana.db