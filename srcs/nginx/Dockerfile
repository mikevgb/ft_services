
FROM        alpine:3.12.1

COPY 		start.sh /start.sh

RUN         apk add \
            nginx \
			&& adduser -D -g 'www' www \
            && mkdir -p /run/nginx

COPY        ./nginx.conf ./etc/nginx/
COPY 		./ft_services_web/ /www/
ADD         ./ssl_keys/* ./etc/nginx/ssl/

ENTRYPOINT  sh start.sh