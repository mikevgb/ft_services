FROM    alpine:3.12.1

RUN     apk update && apk add \
        openssl \
        vsftpd \
        && mkdir /home/ftps \
        && addgroup -S appgroup \
        && adduser -S appuser -G appgroup -h /home/ftps \
#https://stackoverflow.com/questions/49955097/how-do-i-add-a-user-when-im-using-alpine-as-a-base-image
        && touch /home/ftps/test.txt \
	#rm -rf /var/cache/apk/*
        && rm -rf /etc/vsftpd/vsftpd.conf \
        && openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"
COPY    ./vsftpd.conf ./etc/vsftpd/vsftpd.conf
COPY    ./init.sh ./init.sh
      
EXPOSE  20 21

CMD     ./init.sh

#ENTRYPOINT 