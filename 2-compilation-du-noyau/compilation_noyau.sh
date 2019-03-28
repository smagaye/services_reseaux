#!/bin/bash
kernel_id=smag-ubuntu-kernel
kernel_version=4.5.7
noyau_zip=linux-4.5.7.tar.xz
dest_noyau=/usr/src
new_noyau_name=linux-4.5.7
src_config=/boot/config-4.4.0-142-generic
dest_config=.config


# Mise a jour de la base de données des installation
#apt-get update
echo Base données de sites miroir est à jour

# Installation des dépendances pour la compilation du noyau
apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc liblz4-tool kernel-package initramfs-tools debconf-utils dpkg-dev
echo Les dépendances pour la compilation du noyau ont été bien téléchargée.

# Suppression des fichiers temporaires
make-kpkg clean

# Configuration avancée de la compilation
# make menuconfig

# Copie du noyau dans le répertoire /usr/src
cp -R ./kernel/$noyau_zip $dest_noyau

echo Le $noyau_zip a ete bien deplace dans /usr/src

# Ajouter au fichier zip le droit d'éxécution afin de pouvoir le dézipper
chmod +x $dest_noyau/$noyau_zip
echo Droit d\'éxécution accordé au fichier $noyau_zip


#Deplacement vers la source
cd $dest_noyau

# Extraction du noyau
#tar -xvf $noyau_zip
echo Le fichier $noyau_zip a été bien dézippé dans le répertoire $dest_noyau

# Copie du fichier de configuration vers le répertoire de compilation
cp $src_config $dest_config
echo Le fichier de configuration $src_config a été bien déplacé dans $dest_config sous le nom $dest_config

#Déplacement dans le répertoire noyau
cd $new_noyau_name

#Menu de configuration
make menuconfig
echo Menu de configuration parametre

#Compilation du noyau
make-kpkg --initrd --append-to-version=-$kernel_id --revision=$kernel_version --rootcmd=fakeroot kernel_image kernel_headers
echo Le noyau a ete compilé

# Suppression des fichiers temporaires
make-kpkg clean

# Déplacement sur le dossier parent (/usr/src)
cd ..

#Installation
dpkg -i linux*.deb




