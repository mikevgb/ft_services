FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        #&& rm -rf /var/cache/apk/*
        #&& rm -R /var/lib/mysql/* \
        #where we will add mysql db
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld
        #&& chown -R root:root /var/run/mysqld \
#RUN     mariadb-install-db -u root
        #&& rm -R /var/lib/mysql/* \
        #&& mariadb-install-db -u root --datadir="/var/lib/mysql"
COPY    ./my.cnf /etc/my.cnf

EXPOSE  3306
CMD     mariadb-install-db -u root --datadir="/var/lib/mysql" \
        && mysql -u root -e "FLUSH PRIVILEGES;\n GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;\n FLUSH PRIVILEGES; \n"
#ENTRYPOINT  mariadbd -u root
#ENTRYPOINT  mariadbd -u root --datadir="/var/lib/mysql/"
#CMD         mysql -u root -e "FLUSH PRIVILEGES;\n GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;\n FLUSH PRIVILEGES; \n"
