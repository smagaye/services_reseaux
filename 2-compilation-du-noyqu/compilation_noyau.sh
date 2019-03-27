#!/bin/bash
kernel_id=smag_ubuntu_kernel
kernel_version=-4.5.7
noyau_zip=linux-4.5.7.tar.xz
dest_noyau=/usr/src/
new_noyau_name=linux-4.5.7
src_config=/boot/config-4.4.0.31-generic
dest_config=.config



#Se connecter en tant que root
sudo -i 

# Mise a jour de la base de données des installation
apt-get update
echo Base données de sites miroir est à jour

# Installation des dépendances pour la compilation du noyau
apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc liblz4-tool kernel-package initramfs-tools debconf-utils dpkg-dev
echo Les dépendances pour la compilation du noyau ont été bien téléchargée.

# Suppression des fichiers temporaires
make-kpkg clean

# Configuration avancée de la compilation
make menuconfig

# Copie du noyau dans le répertoire /usr/src
cp -R ./kernel/$noyau_zip /usr/src

echo Le $noyau_zip a ete bien deplace dans /usr/src

# Ajouter au fichier zip le droit d'éxécution afin de pouvoir le dézipper
chmod +x $dest_noyau/$noyau_zip
echo Droit d\'éxécution accordé au fichier $noyau_zip

# Extraction du noyau
tar -xvf  $dest_noyau/$noyau_zip
echo Le fichier $noyau_zip a été bien dézippé dans le répertoire $dest_noyau

# Déplacement sur le répertoire de compilation 
cd /nom_noyau_zip/$new_noyau_name


# Copie du fichier de configuration vers le répertoire de compilation
cp -R $src_config ./$dest_config
echo Le fichier de configuration $src_config a été bien déplacé dans $dest_config sous le nom $dest_config

#Compilation du noyau
make-kpkg --initrd --append-to-version=-$kernel_id --revision=$kernel_version --rootcmd=fakeroot kernel_image kernel_headers

# Suppression des fichiers temporaires
make-kpkg clean

# Déplacement sur le dossier parent (/usr/src)
cd ..

#Installation
sudo dpkg -i linux*.deb




