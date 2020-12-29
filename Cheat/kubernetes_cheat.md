#### start:
```docker
minikube start --driver=virtualbox
```

#### point docker to minikube
```
eval $(minikube -p minikube docker-env)	
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
#### check if a yaml file is valid

kubeval $name_of_the_yaml.yaml

#### install kubeval with brew

brew tap instrumenta/instrumenta
brew install kubeval




https://12factor.net