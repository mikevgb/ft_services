#!/bin/bash

echo -e "\n\n\n\e[92mStarting minikube with virtualbox driver.\n";
minikube start --driver=virtualbox
sleep 2
echo -e "\n\n\n\e[92mStarting Proxy. After starting it will not output a response.\n"; 
kubectl proxy &
sleep 5
echo -e "\n\n\n\e[92mStarting kubernetes dashboard.\n";
minikube dashboard