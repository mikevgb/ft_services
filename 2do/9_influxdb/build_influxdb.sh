#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t influxdb .
#run yaml
kubectl apply -f influxdb.yaml