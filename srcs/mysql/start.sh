#!/bin/bash

/usr/bin/mysql_install_db --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --init_file=/create_db & sleep 3
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
mysql wordpress -u root < wordpress.sql
tail -f /dev/null