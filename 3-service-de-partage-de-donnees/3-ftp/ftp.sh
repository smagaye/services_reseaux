#!/bin/bash

#Dependences
bash solve_dependence.sh

#Création d'un utilisateur
bash ftp_new_account.sh ftpgroup 2001 ftpuser

# Connection au server
mysql -u root password root

#Creation de la base de données pour l'authentification
bash ftp_database.sh