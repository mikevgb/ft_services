#### start:
```docker
minikube start --driver=virtualbox
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
#### delete pods
```
kubectl delete pods --all
```
#### delete services
```
kubectl delete services --all
```
#### delete vm created by minikube
```
minikube delete
```
#### show Kubernetes Dashboard
```
minikube dashboard
```
#### shell to the container (we use ash for alpine)
```
kubectl exec -ti ftps-alpine ash
```
#### run yaml
```
kubectl apply -f $yaml_file_dir
```





https://12factor.net