FROM alpine:3.12.1

RUN     apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache grafana \
        && mkdir -p /usr/share/grafana/dashboards/panels

WORKDIR /usr/share/grafana

COPY ./start.sh /usr/share/grafana

COPY ./telegraf-data.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY ./dashboards/panels.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./dashboards/panels/* /usr/share/grafana/conf/provisioning/dashboards/panels/

ENTRYPOINT sh start.sh