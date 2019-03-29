#!/bin/bash

# ./create_volume_group.sh volume_group_name partition_name
# Call script Example :
# ./create_volume_group.sh vg0 partition_name


volume_group_name=$0
# Format systeme de fichier /dev/sda/7
sys_name=$1

partition=$2

# When you create a volum group you must to assign him a parttion
echo Setup initial partition...
pvcreate $sys_name
pvdisplay


echo Setup volume group...
vgcreate $volume_group_name $partition
echo Volume Group $volume_group_name created



