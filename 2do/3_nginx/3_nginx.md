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
start nginx
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