eval $(minikube docker-env)
kubectl delete -f wordpress.yaml
docker image rm -f wordpress
docker system prune -f