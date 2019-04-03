#!/bin/bash

# file value /backup/dpartage
file=$1

#access format (octal) : rw
access=$2

# ip_client format : 192.168.43.0/24
ip_client_with_mask=$3

chmod 777 $file
echo $file $ip_client_with_mask "("$access","sync","no_subtree_check")" >> /etc/exports 

/etc/init.d/nfs-kernel-server restart
