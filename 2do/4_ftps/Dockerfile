FROM    alpine:3.12.1

COPY    ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY    ./init.sh ./

RUN     apk add \
        openssl \
        vsftpd \
        #&& mkdir -p /ftps/42user \
        #&& adduser --home=/ftps/42user -D 42user\
#https://stackoverflow.com/questions/49955097/how-do-i-add-a-user-when-im-using-alpine-as-a-base-image
        #&& mkdir /ftps/42user/uploads \
        #&& chmod 777 /ftps/42user/uploads \
        #&& touch /ftps/42user/42_ftps.txt \
	#rm -rf /var/cache/apk/*
        && rm -rf /etc/vsftpd/vsftpd.conf \
        && openssl req -x509 -nodes -days 365 \
        -newkey rsa:1024 \
        -keyout /etc/vsftpd/vsftpd.pem \
        -out /etc/vsftpd/vsftpd.pem \
        -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/" \
        chmod +x init.sh \
        #&& echo "42user" >> etc/vsftpd/vsftpd.userlist \
        #&& touch /var/log/vsftpd.log
#RUN     chmod 777 /dev/null
EXPOSE  20 21
# RUN     chmod +x /init.sh
#CMD     /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
#CMD     ./init.sh
#ENTRYPOINT     [ "/bin/sh" ]
#CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
ENTRYPOINT ["/init.sh"]
