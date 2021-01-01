#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t ftps .
#run yaml
kubectl apply -f ftps.yaml