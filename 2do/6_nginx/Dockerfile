
FROM        alpine:3.12.1

#RUN         apk update
RUN         apk add \
            nginx \
            openssh \
#RUN     adduser www 
#RUN     mkdir /www
#RUN     chown -R www:www /var/lib/nginx
#RUN     chown -R www:www /www
#RUN     rm -rf /var/cache/apk/*
#RUN         mkdir /etc/nginx/ssl
            && mkdir -p /run/nginx

COPY        ./nginx.conf ./etc/nginx/
ADD         ./ssl/* ./etc/nginx/ssl/
#COPY        ./index.html ./www/index.html
      
#EXPOSE      80 443 22

#not working
#CMD     ["nginx", "-g", "pid /tmp/nginx.pid;"]
#use nginx inside pod
ENTRYPOINT  nginx

#openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mikevgb.key -out mikevgb.crt -subj "/C=ES/ST=Madrid/L=42Madrid/OU=mikevgb/"