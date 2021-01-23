#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t wordpress .
#run yaml
kubectl apply -f wordpress.yaml