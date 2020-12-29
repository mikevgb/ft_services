FROM    alpine

LABEL   mainter "mikevgb"
        #set -x only for debugging
RUN     set -x \
        && apk update && apk add --no-cache \
        mysql \
        mysql-client \
	    #rm -rf /var/cache/apk/*
COPY    ./nginx.conf ./etc/nginx/nginx.conf \
        && ./index.html ./www/index.html
      
EXPOSE  5025

#ENTRYPOINT ["sh"]

#CMD ["-c" , "tail -f /dev/null"]