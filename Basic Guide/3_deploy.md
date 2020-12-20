## A Deployment is responsible for creating and updating instances of your application

#### Provide the deployment name and app image location
```docker
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```
#### What this does?

* search for a node.
* scheduled the application to run on the node
* configured the cluster to reschedule the instance on a new Node when needed

#### list your deployments
```docker
kubectl get deployments
```
#### create proxy that will forward communications into the cluster-wide private network, proxy can be terminated by pressing control-C write this command IN A NEW TERMINAL
```docker
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response.\n"; 
kubectl proxy
```
#### see all APIs hosted through the proxy endpoint
```docker
curl http://localhost:8001/version
```
#### API server automatically creates an endpoint for each pod based on the pod name that is als accesible through proxy get the pod name and store in the environment variable POD_NAME
```docker
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
```
#### see the output of our application
```docker
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
```
#### The url is the route to the API of the Pod.