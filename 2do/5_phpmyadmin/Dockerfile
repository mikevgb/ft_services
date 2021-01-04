FROM        alpine:3.12.1

RUN         apk add phpmyadmin
RUN         rm -rf /etc/phpmyadmin/config.inc.php
COPY        ./config.inc.php /etc/phpmyadmin/config.inc.php
#cmd command not working from dockerfile, needs to be runed manually from inside the pod :(
#CMD     ["-S", "0.0.0.0:5000", "-t", "/usr/share/webapps/phpmyadmin"]
ENTRYPOINT  php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin
#ENTRYPOINT ["php"]
EXPOSE      5000