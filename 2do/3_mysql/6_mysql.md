# mysql

Create pod
```
kubectl run mysql --image=alpine -- sleep infinity
```
install mysql in pod
```
kubectl exec mysql -- apk add mariadb mariadb-client
```