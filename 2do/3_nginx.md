#### Nginx

Create container (this is _wrong_, should be created by my me)
```
kubectl run nginx --image=nginx --port=80
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