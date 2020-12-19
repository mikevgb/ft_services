## Performing a Rolling Update

#### Rolling updates allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones.

#### Rolling updates allow the following actions:

   * Promote an application from one environment to another (via container image updates)
   * Rollback to previous versions
   * Continuous Integration and Continuous Delivery of applications with zero downtime

List deployments
```
kubectl get deployments
```
List Pods
```
kubectl get pods
```
View current image version of the app
```
kubectl describe pods
```
To update the image to the app version 2
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
```
The command notified the Deployment to use a different image for your app and initiated a rolling update.
```
kubectl get pods
```
Check app is running and find out the exposed IP and Port
```
kubectl describe services/kubernetes-bootcamp
```
Create a environment variable called NODE_PORT that has the value Node port assigned
```
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
```
curl the exposed IP and port
```
curl $(minikube ip):$NODE_PORT
```
we hit a different Pod with every request and we see that are running the v2 version

The update can be confirmed also by running
```
kubectl rollout status deployments/kubernetes-bootcamp
```
To view the current image of the app, run a described command agains the Pods
```
kubectl describe pods
```
We can see the v2 on the image field

Perform another update
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
```
Check deployment
```
kubectl get deployments
```
and
```
kubectl get pods
```
We can see that something is wrong, we do not have the desired number of Pods availabe.

There is no image called v10 in the repo.

We can roll back with
```
kubectl rollout undo deployments/kubernetes-bootcamp
```
We list again
```
kubectl get pods
```
We see that the deployment is using the v2, the rollback was successful.