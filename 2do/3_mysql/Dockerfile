FROM    alpine:3.12.1

RUN     apk add mariadb \
        mariadb-client \
        #&& rm -rf /var/cache/apk/*
        #add owner top /var/lib/mysql folder
        && mkdir -p /run/mysql \
        && chown root:root /var/lib/mysql

COPY    ./my.cnf /etc/my.cnf

EXPOSE  3306

#ENTRYPOINT mariadb