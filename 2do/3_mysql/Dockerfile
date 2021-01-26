FROM    alpine:3.12.1

COPY    ./my.cnf ./etc/my.cnf
COPY    ./mysql.sql ./mysql.sql

RUN     apk add mariadb \
        mariadb-client \
        && mkdir -p /run/mysqld \
        && chown -R root:root /run/mysqld \
        && mariadb-install-db --datadir="/var/lib/mysql"

#COPY    ./my.cnf ./etc/my.cnf
#COPY    ./mysql ./var/lib/mysql

EXPOSE  3306

CMD mysql -uroot -p mysql < mysql.sql
#!!! may need to FLUSH PRIVILEGES
ENTRYPOINT  mariadbd --datadir="/var/lib/mysql/"


#CMD         mysql "CREATE USER 'root'@'%' IDENTIFIED BY '';\n \
#                    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';\n \
#                    CREATE DATABASE wordpress; \n"

#list users in mysql
# SELECT User FROM mysql.user;

#list databases
# SHOW DATABASES;

#backup mysql database using

#mysqldump -u root -p mysql > mysql.sql

#restore mysql database by executing

#mysql -uroot -p mysql < mysql.sql

#Dont forget to

#FLUSH PRIVILEGES