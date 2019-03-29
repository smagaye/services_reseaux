#!/bin/bash

# ./create_volume_group.sh volume_group_name partition_name
# Call script Example :
# ./create_volume_group.sh vg0 partition_name


volume_group_name=$0
# Format systeme de fichier /dev/sda7
sys_name=$1

# When you create a volum group you must to assign him a parttion
echo Setup partition...
pvcreate $sys_name
echo Partition $sys_name was create successfully.
pvdisplay


echo Setup volume group...
vgcreate $volume_group_name $sys_name
echo Le groupe de volume groupe_volume_name créé



