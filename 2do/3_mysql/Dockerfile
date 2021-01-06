FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld
COPY    ./my.cnf /etc/my.cnf
EXPOSE  3306
CMD     mariadb-install-db -u root --datadir="/var/lib/mysql" \
        && mysql -u root -e "FLUSH PRIVILEGES;\n GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;\n FLUSH PRIVILEGES; \n"
#ENTRYPOINT  mariadbd -u root --datadir="/var/lib/mysql/"