FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld
COPY    ./mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
EXPOSE  3306
ENTRYPOINT  mariadb-install-db -u root --datadir="/var/lib/mysql" \
            mariadbd-safe -u root --datadir="/var/lib/mysql/"
#CMD     mysql -u root -e "FLUSH PRIVILEGES;\n GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;\n \
#        CREATE DATABASE IF NOT EXIST wordpress; \
#        GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'root'; \
#        FLUSH PRIVILEGES; \n"