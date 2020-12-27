#Create pod
kubectl run mysql --image=alpine -- sleep infinity

#install mysql in pod
kubectl exec mysql -- apk add mariadb mariadb-client

#wait for mysql
until mysql
do
	echo "NO_UP"
done

#create database (!!!! not working)
kubectl exec mysql -- mysql -u root --skip-password
