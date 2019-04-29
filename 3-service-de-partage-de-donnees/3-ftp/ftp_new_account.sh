#!/bin/bash

#Callback
#bash ftp_new_account.sh ftpgroup 2001 ftpuser

group=$1
group_id=$2
user=$3


groupadd -g $group_id $group
useradd -u $group_id -s /bin/false -d /bin/null -c "pureftpd user" -g $group $user

#/etc/pure-ftpd/db/mysql.conf
