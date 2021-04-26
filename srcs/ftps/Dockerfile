FROM            alpine:3.12.1

COPY            ./vsftpd.conf ./start.sh ./

RUN             apk add openssl vsftpd \
		        && mkdir -p /etc/ftps/ftp_folder \
				&& adduser --home=/etc/ftps/ftp_folder -D admin \ 
				&& echo "admin:admin" | chpasswd \
	            && touch /etc/ftps/ftp_folder/42_ftps.txt \
	            && openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
 				-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt \
 				-subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"

ENTRYPOINT	sh start.sh
