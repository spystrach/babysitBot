#!/bin/sh
# RECHARGE LE BOT

# navigue dans le bon dossier
cd && cd "/home/$(whoami)/Documents/babysitBot" || exit

# stopppe le conteneur
docker stop babysit_bot_1

# supprime le conteneur
docker rm babysit_bot_1

# supprime l'image
docker image rm babysit_bot

# reconstruit l'image
docker build -t babysit_bot .

# lance le nouveau conteneur
docker run -d --restart=unless-stopped --name babysit_bot_1 babysit_bot

# fin
cd || exit
