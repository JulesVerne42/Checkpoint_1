#!/bin/bash

# Script pour créer un ou plusieurs utilisateurs.

# 0001 Vérification de la présence d'arguments
if [ $# -eq 0 ];
then
	echo "Il manque les noms d'utilisateurs en argument"
	exit 1
fi


# 0010 Vérification de l'existance de l'utilisateur
for user in $@;
do
	if cat /etc/passwd | grep -q $user
	then echo  "L'utilisateur $user existe déjà"

# 0011 Création de l'utilisateur
	else useradd $user

# 0100 Vérification de l'ajout
	if cat /etc/passwd | grep -q  $user
	then echo "L'utilisateur $user a bien été créé"
	else echo "Erreur a la creation de l'utilisateur $user"
	fi
	fi
done

