#!/bin/bash

tmp_folder=/tmpfolder
# Create a temporel folder
mkdir $tmp_folder

# Create a new volum group vgo
./create_volume_group.sh  vg01 /dev/sda4


# Move all contents of directory /var in $tmp_folder
mv /var/* $tmp_folder

# Create a partition rootvar mounted in var
./create_partition.sh vg01 rootvar 1G ext4 /var  

# Move all contents of directory $tmp_folder in /var
mv $tmp_folder/* /var


# Move all contents of directory /home in $tmp_folder
mv /home/* $tmp_folder

# Create a partition roothome mounted in /home
./create_partition.sh vg01 roothome 200M ext4 /home

# Move all contents of directory $tmp_folder in /home
mv $tmp_folder/* /home

# Remove temporel folder
rm $tmp_folder
