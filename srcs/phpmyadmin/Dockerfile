FROM        alpine:3.12.1

COPY 		start.sh /start.sh
COPY 	    ./nginx.conf /etc/nginx/nginx.conf
COPY        ./config.inc.php /etc/phpmyadmin/config.inc.php

RUN         apk add \
            phpmyadmin \
            nginx \
            php7 \
            php7-mysqli \
            php7-json \
            php7-mbstring \
            php7-fpm \
            php7-opcache \
            && adduser -D -g 'www' www \
		    && mkdir -p /run/nginx www \
            && chown -R www:www /var/lib/nginx \
		    && chown -R www:www /www \
            && mv /usr/share/webapps/phpmyadmin /www/ \
            && mkdir  -p  /etc/phpmyadmin/tmp \
            && chmod 777 /etc/phpmyadmin/tmp

ENTRYPOINT  sh start.sh