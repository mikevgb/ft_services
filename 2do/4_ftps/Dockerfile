FROM    alpine

LABEL   mainter "mikevgb"
        #set -x only for debugging
RUN     set -x \
        && mkdir /home/ftps \
        && adduser -p p4ssw0rd -g 'ftps' -h /home/ftps username \
        && chown username /home/ftps \
        && touch /home/ftps/test.txt \
        && apk update && apk add --no-cache \
        openssl \
        vsftpd \
	    #rm -rf /var/cache/apk/*
        && rm -rf /etc/vsftpd/vsftpd.conf\
        && openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/" \
COPY    ./vsftpd.conf ./etc/vsftpd/vsftpd.conf
      
EXPOSE  21

CMD     ["vsftp", "-g", "daemon off;"]

#ENTRYPOINT 