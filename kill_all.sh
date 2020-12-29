#!/bin/bash

docker rmi $(docker images -q)
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete services --all
