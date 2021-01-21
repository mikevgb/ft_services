eval $(minikube docker-env)
kubectl delete -f mysql.yaml
docker image rm -f mysql
docker system prune -f
#kubectl delete pv --all