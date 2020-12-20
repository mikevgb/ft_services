## When traffic increases, we will need to scale the application to keep up with user demand. Scaling is accomplished by changing the number of replicas in a Deployment.

#### To see the ReplicaSet created by the Deployment

```
kubectl get rs
```

* DESIRED displays the desired number of replicas of the application, which you define when you create the Deployment. This is the desired state.
* CURRENT displays how many replicas are currently running.

Scale the deployment to 4 replicas

```
kubectl scale deployments/kubernetes-bootcamp --replicas=4
```

Check
```
kubectl get deployments
```

Check number of pods has changed
```
kubectl get pods -o wide
```
We can see that we have 4 pods with 4 different IPs,
this change can be found in the event log. To check this we will do
```
kubectl describe deployments/kubernetes-bootcamp
```
we can see 4 replicas

Check that the service is load balancing the traffic, check the
exposed IP and port
```
kubectl describe services/kubernetes-bootcamp
```
Create an environment variable called NODE_PORT that has
a value as the Node port
```
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
```
Next will curl to the exposed IP and port
```
curl $(minikube ip):$NODE_PORT
```
For scaling down to 2 replicas
```
kubectl scale deployments/kubernetes-bootcamp --replicas=2
```
List the deployments for check
```
kubectl get deployments
```
List the pods
```
kubectl get pods -o wide
```
This confirms that 2 Pods were terminated