eval $(minikube docker-env)
kubectl delete -f grafana.yaml
docker image rm -f grafana
docker system prune -f