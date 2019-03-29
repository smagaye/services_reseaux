#!/bin/bash

# ./create_volume_group.sh volume_group_name partition_name
# Call script Example :
# ./create_volume_group.sh vg0 /dev/sda7


volume_group_name=$0
# Format systeme de fichier /dev/sda/7
partition_lvm=$1

# When you create a volum group you must to assign him a parttion
echo Setup initial partition...
pvcreate $partition_lvm
pvdisplay

echo Setup volume group...
vgcreate $volume_group_name $partition
echo Volume Group $volume_group_name created...
vgdisplay


