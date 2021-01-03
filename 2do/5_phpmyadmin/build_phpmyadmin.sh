#connect docker with kubernetes
eval $(minikube docker-env)
#run dockerfile
docker build -t phpmyadmin .
#run yaml
kubectl apply -f phpmyadmin.yaml