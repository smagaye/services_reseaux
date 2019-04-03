#!/bin/bash

# Create a partition backup mounted in var
bash ../../../1-Installaion-manuelle-ubuntu-server/create_partition.sh vg01 backup 300MB ext4 /backup  

cd /backup
mkdir /backup/dpartage

bash share_a_folder.sh /backup/dpartage rw 192.168.43.172/24
