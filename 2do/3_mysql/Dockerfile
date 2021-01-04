FROM    alpine:3.12.1

RUN     apk add --no-cache \
        mysql \
        mysql-client \
        && mkdir -p /run/mysql \
	    #rm -rf /var/cache/apk/*
RUN     echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
RUN     echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
RUN     echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
RUN     echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

        #not sure if 3306  
EXPOSE  3306

#ENTRYPOINT ["sh"]

#CMD ["-c" , "tail -f /dev/null"]