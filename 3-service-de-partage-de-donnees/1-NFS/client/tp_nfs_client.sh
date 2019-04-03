
#!/bin/bash

# D'abord créer un répertoire sur Client où vont s'installer les fichiers de Serveur :
sudo mkdir /Users/apple/backup/nfs/Partage

# Couplage entre la partition du serveur et le dossier 
echo 192.168.1.184:/backup/dpartage  /Users/apple/nfs/Partage   nfs    user,noauto    0   0 >> /etc/fstab