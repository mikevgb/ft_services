FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld
COPY    ./my.cnf /etc/my.cnf
EXPOSE  3306
ENTRYPOINT  mariadb-install-db --datadir="/var/lib/mysql" && \
            mariadbd --datadir="/var/lib/mysql/"
CMD         mysql "CREATE USER 'root'@'%' IDENTIFIED BY '';\n \
                    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\n \
                    CREATE DATABASE wordpress; \n"
#CMD         mysql && \
#            "CREATE DATABASE wordpress; \n \
#            CREATE USER 'root'@'%' IDENTIFIED BY '';\n \
#            GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\n \
#            FLUSH PRIVILEGES;\n \
#            EXIT"