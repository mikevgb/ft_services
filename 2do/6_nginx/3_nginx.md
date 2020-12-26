#### Nginx

Create container (this is _wrong_, should be created by my me)
```
kubectl run nginx --image=nginx --port=80
```
_correct_
```
kubectl run nginx --image=alpine --port=80 -- sleep infinity
```
update
```
kubectl exec nginx -- apk update
```
install nginx
```
kubectl exec nginx -- apk add nginx
```
Create user and nginx directory
```
kubectl exec nginx -- adduser -h /home/www/ nginx_user
```
or, in alpine guide for nginx
```
kubectl exec nginx -- adduser -D -g 'www' www
```
create a directory for html files
```
kubectl exec nginx -- mkdir /www
```
change permissions
```
kubectl exec nginx -- chown -R www:www /var/lib/nginx
kubectl exec nginx -- chown -R www:www /www
```
back up original nginx conf file
```
kubectl exec nginx -- mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
```
copy moded nginx conf and index
```
kubectl cp ~/ft_services/2do/3_nginx/nginx.conf nginx:/etc/nginx/nginx.conf

kubectl cp ~/ft_services/2do/3_nginx/index.html nginx:/www/index.html
```
start nginx !(not working atm)
```
kubectl exec nginx -- /etc/init.d/nginx start
```

Deployment can be see in the kubernetes dashboard

Check from the terminal
```
kubectl get pods
```
get more info from this pod
```
kubectl describe pod nginx
```
expose pod as a service
```
kubectl expose deployment/nginx --type="LoadBalancer"
```
if you want to show the url of the service use (not working :O)
```
minikube service nginx --url=true
```
migfernas link
```
https://www.cyberciti.biz/faq/how-to-install-nginx-web-server-on-alpine-linux/
```