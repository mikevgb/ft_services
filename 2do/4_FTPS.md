# FTPS

#### FTPS vs SFTP

FTPS is FTP + SSL, like FTP it uses 2 connections, one channel for commands and the other for data. FTPS authenticates the conexion using an ID (user and password), a cert or both.

SFTP uses only one connection based on SSH, authenticates also with ID, but this credentials are encrypted. It can also use SSH keys.

#### Create

```
kubectl run ftps-alpine --image=alpine --port=21 -- sleep infinity
```
check
```
kubectl describe pod ftps-alpine
```
Shell to the container, Alpine uses ash 
```
kubectl exec -ti ftps-alpine ash
```
***we can also execute commands directly on the container with exec and the name of the pod***
```
kubectl exec $POD_NAME env
```
Inside the pod we install vsftpd and openssl
```
apk add vsftpd openssl
```
now we will create the SSL cert (_rsa_cert_file_) and RSA key (_rsa_private_key_file_) we will store it in _/etc/vsftpd/_

Generate SSL cert
```
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
```
now we need to edit the vsftpd.conf file we will need a text editor
```
apk add nano
```
now we nano vsftpd.conf
```
nano /etc/vsftpd/vsftpd.conf
```
Enable encryption on data transfer and authentication (add this lines)
```
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```
Include the cert and key file location
```
rsa_cert_file=/etc/vsftpd/vsftpd.pem
rsa_private_key_file=/etc/vsftpd/vsftpd.pem
```
enable TLS
```
ssl_sslv2=YES
ssl_sslv3=YES
```
Now we start the vsftpd service and pass the .conf as argument
```
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
```





expose the service
```
kubectl expose deployment/ftps-alpine --type="LoadBalancer"
```

Yaml example:
* A deployment name ftps-alpine will be created, inditcated by the _metadata: name_ field.
* The deployment will create 1 replica of the Pod, indicated by the _replicas_ field.
* The Pod template, or _spec: template_ field, indicates that its Pods are labeled _app: ftps-alpine_
* The Pod template's specification, or _template: spec_