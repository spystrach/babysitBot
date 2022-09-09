# BABYSITBOT

![PyPI - Python Version](https://img.shields.io/pypi/pyversions/python-telegram-bot)

![](photo_babysitBot.svg)

Un bot telegram qui permet de suivre les journées de garde d'enfants et calculer les salaires (barèmes de la PAJE) ! :euro: :pen:

## protocole d'installation

Copier le dossier sur le serveur et créer un fichier **.env** qui va contenir le token d'identitification du bot. Il faut ensuite lancer le conteneur docker :
```sh
# récupération du projet sur le serveur
gh repo clone spystrach/babysitBot && cd babysitBot
# ajoute le token telegram
echo "token={TOKEN}" > .env
# construit l'image et lance le docker
sh restartBabysitBot.sh
```

## protocole de développement

Pour tester et améliorer le bot, il faut télécharger ce dossier en local, créer un environnement virtuel python et lancer le programme :
```sh
# récupération du projet
gh repo clone spystrach/babysitBot && cd babysitBot
# ajoute le token
echo "token={TOKEN}" > .env
# environnement virtuel de développement
python3 -m venv venv && source venv/bin/activate
# dépendances
pip3 install -r requirements_dev.txt
# lancer le programme
python3 babysitBot.py
```

## protocole de mise à jour

Le script *babysitBot_update.py* sert à mettre à jour le bot sur le serveur à partir du dossier distant. Il néccessite un **accès ssh fonctionnel** avec un empreinte ssh enregistrée et une installation locale pour le développement. Il faut ensuite ajouter le nom de l'utilisateur du serveur et le chemin vers le dossier babysitBot :
```sh
# ajoute le nom d'utilisateur et le dossier de musicaBot du serveur
echo "username={USERNAME}" >> .env
echo "folder=~/{PATH}/{TO}/{INTERIMBOT}" >> .env
# met à jour le bot
python3 babysitBot_update.py
```

Il faut aussi modifier le chemin ligne 4 de *restartBabysitBot.sh*

## A FAIRE

- [x] : token d'identitification non hardcodé
- [x] : integrer un Dockerfile au projet
- [x] : mieux gérer les mises à jours coté serveur
- [x] : base de donnée triée selon l'utilisateur
- [ ] : ajouter des tests
- [ ] : build de l'image dans docker hub
