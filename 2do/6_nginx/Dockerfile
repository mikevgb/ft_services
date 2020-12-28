
FROM    alpine

LABEL   mainter "mikevgb"
        #set -x only for debugging
RUN     set -x \
        && adduser -p p4ssw0rd -g 'www' -h /home/www/ www \
        && mkdir /www \
        && chown -R www:www /var/lib/nginx \
        && chown -R www:www /www \
        && apk update && apk add --no-cache \
        openssl \
        nginx \
        openssh \
	    #rm -rf /var/cache/apk/*
        && mkdir /etc/nginx/ssl && \
        && openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/nginx/ssl/services42.pem -out /etc/nginx/ssl/nginx.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/" \
COPY    ./nginx.conf ./etc/nginx/nginx.conf \
        && ./index.html ./www/index.html
      
EXPOSE  80 443 22

CMD     ["nginx", "-g", "daemon off;"]

#ENTRYPOINT