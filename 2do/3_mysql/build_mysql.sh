#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t mysql .
#run yaml
kubectl apply -f mysql.yaml