#### start:
```docker
minikube start
```
#### in other terminal
```docker
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response.\n"; 
kubectl proxy
```
#### check
```docker
kubectl get pods
kubectl get services
```