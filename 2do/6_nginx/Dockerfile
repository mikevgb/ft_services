
FROM        alpine:3.12.1

RUN         apk update
RUN         apk add nginx openssl openssh
#RUN     adduser www 
#RUN     mkdir /www
#RUN     chown -R www:www /var/lib/nginx
#RUN     chown -R www:www /www
#RUN     rm -rf /var/cache/apk/*
RUN         mkdir /etc/nginx/ssl
RUN         mkdir -p /run/nginx
RUN         openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/nginx/ssl/services42.pem -out /etc/nginx/ssl/nginx.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"
COPY        ./nginx.conf ./etc/nginx/nginx.conf
COPY        ./index.html ./www/index.html
      
EXPOSE      80 443 22

#not working
#CMD     ["nginx", "-g", "pid /tmp/nginx.pid;"]
#use nginx inside pod
ENTRYPOINT  nginx