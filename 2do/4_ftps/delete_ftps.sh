eval $(minikube docker-env)
kubectl delete -f ftps.yaml
docker image rm -f ftps
sleep 30
docker system prune -f
#sleep 30
#docker image ls -a | grep -y "<none>" | awk '{print $3}' | xargs docker image rm -f
