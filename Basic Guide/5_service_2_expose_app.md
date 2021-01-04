## A Kubernetes Service is an abstraction layer which defines a logical set of Pods and enables external traffic exposure, load balancing and service discovery for those Pods.

## What is a Service in Kubernetes?

A Service enables network access to a set of Pods in Kubernetes.

Services select Pods based on their labels. When a network request is made to the service, it selects all Pods in the cluster matching the service's selector, chooses one of them, and forwards the network request to it.

Create a new service and expose to external traffic use the NodePort command
 
 ```docker
 kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
 ```

To find out what port was opened externally (by the NodePort option)

 ```docker
 kubectl describe services/kubernetes-bootcamp
 ```

create environment variable called NODE_PORT that has the value of the Node port assigned:

 ```docker
 export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
 ```

```docker
echo NODE_PORT=$NODE_PORT
```

test that the app is exposed outside of the cluser using curl
the IP of the Node and he externally exposed port

```docker
curl $(minikube ip):$NODE_PORT
```

we can see the name of the label

```docker
kubectl describe deployment
```

we use the label to query the list of pods #NOTE LABEL CHANGES.......

```docker
kubectl get pods -l app=kubernetes-bootcamp
```

 we can do the same to list the existing services #AGAIN, LABEL CHANGES.......

```docker
kubectl get services -l app=kubernetes-bootcamp
```

 get the name of the Pod and store it in the POD_NAME environment variable

```docker
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
```

```docker
echo Name of the Pod: $POD_NAME
```

to apply a new label we use the label command followed by the object
type, object name and the new label

```docker
kubectl label pod $POD_NAME app=v1 
```       
 we can use 
```docker
--overwrite
``` 
to force the name change

we can check it with the describe pod command

```docker
kubectl describe pods $POD_NAME
```

we can query now the list of pods using the new label

```docker
kubectl get pods -l app=v1
```

for deleting a service use

```docker
kubectl delete service -l app=kubernetes-bootcamp
```

confirm that is deleted

```docker
kubectl get services
```

confirm that the route is not exposed curl the prev. IP

```docker
curl $(minikube ip):$NODE_PORT
```

confirm that the app is still runnning with curl inside

```docker
kubectl exec -ti $POD_NAME curl localhost:8080