#Create pod
kubectl run mysql --image=alpine -- sleep infinity

#install mysql in pod
kubectl exec mysql -- apk add mysql mysql-client

#create database
kubectl exec mysql -- mysql -u root --skip-password