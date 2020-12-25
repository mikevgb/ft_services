# FTPS

#### FTPS vs SFTP

FTPS is FTP + SSL, like FTP it uses 2 connections, one channel for commands and the other for data. FTPS authenticates the conexion using an ID (user and password), a cert or both.

SFTP uses only one connection based on SSH, authenticates also with ID, but this credentials are encrypted. It can also use SSH keys.
#### LINKS
```
https://www.opensourceforu.com/2015/03/set-up-an-ftps-server-in-linux/
```
it seems that sleep infinity is a bad practice, insted we should use ENTRYPOINT
```
ENTRYPOINT ["tail", "-f", "/dev/null"]
```
link sobre entrypoint
```
https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
```
other way will be with cat (this is how Jenkins do it) (seems wrong way also)

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
we can also execute commands directly on the container with exec and the name of the pod
```
kubectl exec ftps-alpine apk add vsftpd openssl nano
```
now we will create the SSL cert (_rsa_cert_file_) and RSA key (_rsa_private_key_file_) we will store it in _/etc/vsftpd/_
Generate SSL cert
```
kubectl exec ftps-alpine -- openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"
```
delete the vsftpd.conf file
```
kubectl exec ftps-alpine -- rm -rf /etc/vsftpd/vsftpd.conf
```
delete content inside vsftpd.conf (not working)
```
kubectl exec ftps-alpine -- ash -c "echo -n > /etc/vsftpd/vsftpd.conf"
```
create a new vsftpd.conf with the correct values
https://linux.die.net/man/5/vsftpd.conf
```
kubectl exec -it ftps-alpine -- ash -c "echo anonymous_enable=YES
background=YES
seccomp_sandbox=NO
listen=YES
write_enable=YES
local_umask=022
use_localtime=YES
chroot_local_user=YES
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
rsa_cert_file=/etc/vsftpd/vsftpd.pem
rsa_private_key_file=/etc/vsftpd/vsftpd.pem
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO > /etc/vsftpd/vsftpd.conf"
```
Create a user_list for login (inside the pod)
```
kubectl exec ftps-alpine adduser test
```
create a folder for this user
```
kubectl exec ftps-alpine mkdir /home/test/ftp
```
give user test the ownership of the folder
```
kubectl exec ftps-alpine chown test /home/test/ftp
```
create a file inside that folder
```
kubectl exec ftps-alpine 
Now we start the vsftpd service and pass the .conf as argument (not working, had to run from inside the terminal)
```
kubectl exec ftps-alpine -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
```
test
```
curl 192.168.99.102:21 -u $user_name
```
or
```
curl -o -u test:123 192.168.99.10:21/test.txt
```


expose the service
```
kubectl expose pod ftps-alpine --type=LoadBalancer --port=21 --target-port=21
```

Yaml example:
* A deployment name ftps-alpine will be created, inditcated by the _metadata: name_ field.
* The deployment will create 1 replica of the Pod, indicated by the _replicas_ field.
* The Pod template, or _spec: template_ field, indicates that its Pods are labeled _app: ftps-alpine_
* The Pod template's specification, or _template: spec_