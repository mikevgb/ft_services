FROM        alpine:3.12.1

RUN         apk add \
            php7 \
            php7-mysqli \
            php7-json \
            php7-mbstring \
            php7-fpm \
            nginx \
            && wget http://wordpress.org/latest.tar.gz \
            && adduser -D -g 'www' www \
		    && mkdir -p /run/nginx www \
            && chown -R www:www /var/lib/nginx \
		    && chown -R www:www /www \
            && tar -xzvf latest.tar.gz \
            && rm latest.tar.gz \
            && mv /wordpress /www

COPY 		start.sh /start.sh
COPY        wp-config.php /www
COPY        nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT  sh start.sh