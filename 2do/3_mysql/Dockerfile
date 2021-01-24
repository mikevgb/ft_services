FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld \
        && mariadb-install-db --datadir="/var/lib/mysql"

COPY    ./my.cnf /etc/my.cnf
COPY    ./mysql /var/lib/

EXPOSE  3306

ENTRYPOINT  mariadbd --datadir="/var/lib/mysql/"


#CMD         mysql "CREATE USER 'root'@'%' IDENTIFIED BY '';\n \
#                    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\n \
#                    CREATE DATABASE wordpress; \n"

#list users in mysql
# SELECT User FROM mysql.user;

#list databases
# SHOW DATABASES;