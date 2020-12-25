#### For load balancing we will use Metallb

first we check addons available
```
minikube addons list
```
we enable the addon using
```
minikube addons enable metallb
```
check that are up
```
kubectl get pods -n metallb-system
```
controller assigns IP address, speaker advertises layer-2
IP address

now we configure the Metallb addon
```
minikube addons configure metallb
```
it will ask for an IP, we should use the host ip +1
```
minikube ip
```
then it will ask for and end IP, we will use +10 IP

now we can check the config
```
kubectl describe configmap config -n metallb-system
```
if the previous command doesn't show the addresses we can disable and enable the addon
```
minikube addons disable metallb
```
```
minikube addons enable metallb
```