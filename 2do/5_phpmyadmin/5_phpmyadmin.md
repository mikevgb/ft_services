# phpmyadmin

#### Create

Create pod
```
kubectl run phpmyadmin --image=alpine --port=5000 -- sleep infinity
```
install php in pod
```
kubectl exec phpmyadmin -- apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
```



expose phpmyadmin
```
kubectl expose pod phpmyadmin --type=LoadBalancer --port=5000 --target-port=5000
```
