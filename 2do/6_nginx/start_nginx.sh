
#Create container
kubectl run nginx --image=alpine --port=80 -- sleep infinity

#update
kubectl exec nginx -- apk update

#install ngix and openssl
kubectl exec nginx -- apk add nginx openssl openssh

#mod permissions
kubectl exec nginx -- chown -R www-data /var/www/*
kubectl exec nginx -- chmod -R 755 /var/www/*

#create a folder for the web (!!!!!)
kubectl exec nginx -- mkdir /var/www/services42
kubectl exec nginx -- touch /var/www/services42/index.php
kubectl exec nginx -- ash -c "echo "<?php phpinfo(); ?>" >> /var/www/services42/index.php"

#create folder and generate ssl
kubectl exec nginx -- mkdir /etc/nginx/ssl

kubectl exec nginx -- openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/nginx/ssl/services42.pem -out /etc/nginx/ssl/nginx.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"

#copy moded nginx conf and index
kubectl cp ~/ft_services/2do/3_nginx/nginx.conf nginx:/etc/nginx/nginx.conf

kubectl cp ~/ft_services/2do/3_nginx/index.html nginx:/www/index.html
