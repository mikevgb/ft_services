FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        #&& rm -rf /var/cache/apk/*
        #&& rm -R /var/lib/mysql/* \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld \
        #&& chown -R root:root /var/run/mysqld \
        #install mysql
        && mariadb-install-db -u root --datadir="/var/lib/mysql" \
        && rm -R /var/lib/mysql/* \
        && mariadb-install-db -u root --datadir="/var/lib/mysql"

#COPY    ./my.cnf /etc/my.cnf
COPY    ./my.cnf /etc/my.cnf

EXPOSE  3306

#run mysql
#ENTRYPOINT  mariadbd -u root --datadir="/var/lib/mysql/"