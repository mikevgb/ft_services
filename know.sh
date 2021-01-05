#!/bin/bash
#connect docker with kubernetes
eval $(minikube docker-env)
#list docker images
echo "----->IMAGES";
docker images
#list pods
echo "----->PODS";
kubectl get pods
#list services
echo "----->SERVICES";
kubectl get services
echo "----->P_VOLUMES";
kubectl get pv
kubectl get pvc