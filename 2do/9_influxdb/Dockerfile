FROM        alpine:3.12.1

RUN         apk add influxdb

CMD influx \n \
    CREATE DATABASE grafana 
ENTRYPOINT  influxd -config /etc/influxdb.conf