FROM    alpine

LABEL   mainter "mikevgb"
        #set -x only for debugging
RUN     set -x \
        && apk update && apk add --no-cache \
        mysql \
        mysql-client \
        && mkdir -p /run/mysql \
	    #rm -rf /var/cache/apk/*
COPY    ./nginx.conf ./etc/nginx/nginx.conf \
        && ./index.html ./www/index.html
        #not sure if 3306  
EXPOSE  3306

#ENTRYPOINT ["sh"]

#CMD ["-c" , "tail -f /dev/null"]