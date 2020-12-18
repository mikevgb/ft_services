## A Pod is a group of one or more application containers (such as Docker) and includes shared storage (volumes), IP address and information about how to run them.

    kubectl get - list resources
    kubectl describe - show detailed information about a resource
    kubectl logs - print the logs from a container in a pod
    kubectl exec - execute a command on a container in a pod

#### verify that the application is running
```docker
kubectl get pods
```
#### view what containers are inside that Pod and what images are used
```docker
kubectl describe pods
```
#### container logs(we dont need to specify the container name because we only have one container inside the pod)
```docker
kubectl logs $POD_NAME
```
#### execute commands directly on the container with exec and the name of the pod
```docker
kubectl exec $POD_NAME env
```
#### start a bash session in the Pod's container
```docker
kubectl exec -ti $POD_NAME bash
```
#### check that the app is up running curl
```docker
curl localhost:8080
```
#### close the container connection
```docker
exit
```