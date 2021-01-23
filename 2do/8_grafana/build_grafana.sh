#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t grafana .
#run yaml
kubectl apply -f grafana.yaml