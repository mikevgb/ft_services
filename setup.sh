#!/bin/bash

echo -e "\n\n\n\e[92mStarting minikube with virtualbox driver.\n";
minikube start --cpus 4 --memory 4000 --driver=virtualbox
sleep 2
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response.\n"; 
kubectl proxy &
sleep 5
echo -e "\n\n\n\e[92mStarting kubernetes dashboard.\n";
echo -e "minikube metrics server";
minikube addons disable metrics-server
minikube addons enable metrics-server
echo -e "setting metallb...";
minikube addons enable metallb
kubectl apply -f srcs/metallb/metallb.yaml
echo -e "connect docker with minikube"
eval $(minikube -p minikube docker-env)
cd ./srcs/mysql/
docker build -t mysql .
kubectl apply -f mysql.yaml
cd ../../
cd ./srcs/ftps/
docker build -t ftps .
kubectl apply -f ftps.yaml
cd ../../
cd ./srcs/phpmyadmin/
docker build -t phpmyadmin .
kubectl apply -f phpmyadmin.yaml
cd ../../
cd ./srcs/nginx/
docker build -t nginx .
kubectl apply -f nginx.yaml
cd ../../
cd ./srcs/wordpress/
docker build -t wordpress .
kubectl apply -f wordpress.yaml
cd ../../
cd ./srcs/grafana/
docker build -t grafana .
kubectl apply -f grafana.yaml
cd ../../
cd ./srcs/influxdb/
docker build -t influxdb .
kubectl apply -f influxdb.yaml
cd ../../
cd ./srcs/telegraf/
docker build -t telegraf .
kubectl apply -f telegraf.yaml
cd ../../
echo -e "\n\n\n\e[92mStarting kubernetes dashboard.\n";
minikube dashboard