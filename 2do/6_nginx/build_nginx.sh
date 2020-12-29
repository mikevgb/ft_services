#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t nginx .
#run yaml
kubectl apply -f nginx.yaml