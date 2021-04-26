FROM    alpine:3.12.1

COPY    ./my.cnf ./etc/my.cnf
COPY    ./wordpress.sql ./create_db ./start.sh ./

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld

ENTRYPOINT      sh start.sh
