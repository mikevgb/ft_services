#!/bin/bash

#install stuff in container
kubectl exec ftps-alpine apk add vsftpd openssl
#generate ssl cert
kubectl exec ftps-alpine -- openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem -subj "/C=ES/ST=Madrid/L=Madrid/OU=mikevgb/"
#delete vsftpd conf file
kubectl exec ftps-alpine -- rm -rf /etc/vsftpd/vsftpd.conf
#copy a the new conf
kubectl cp ~/ft_services/2do/4_ftps/vsftpd.conf ftps-alpine:/etc/vsftpd/vsftpd.conf
#change the owner of the new conf
kubectl exec ftps-alpine -- chown root /etc/vsftpd/vsftpd.conf
#create user for ftps server

#start vsftp
kubectl exec ftps-alpine -- /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf