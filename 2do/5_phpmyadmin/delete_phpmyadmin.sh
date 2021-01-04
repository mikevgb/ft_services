eval $(minikube docker-env)
kubectl delete -f phpmyadmin.yaml
docker image rm -f phpmyadmin
docker system prune -f