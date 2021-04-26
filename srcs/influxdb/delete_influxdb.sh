eval $(minikube docker-env)
kubectl delete -f influxdb.yaml
docker image rm -f influxdb
docker system prune -f