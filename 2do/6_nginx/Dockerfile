
FROM    alpine

LABEL   mainter "mikevgb"

COPY    ./nginx.conf ./etc/nginx/nginx.conf \
        ./index.html ./www/index.html

RUN     apk update && apk add \
        openssl \
        nginx \
        openssh

CMD     mkdir /etc/nginx/ssl && \
        openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/nginx/ssl/services42.pem -out /etc/nginx/ssl/nginx.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"

EXPOSE  80 443 22