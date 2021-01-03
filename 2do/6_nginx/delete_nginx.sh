kubectl delete -f nginx.yaml
docker image rm -f nginx
docker system prune -f