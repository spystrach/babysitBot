# ne fonctionne pas avec bullseye sur raspberry pi
# FROM python:3.10-slim
FROM python:3.10-slim-buster

# installation des locales
RUN apt-get update && \
    apt-get install -y locales && \
    rm -r /var/lib/apt/lists/*
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

# non root-user
WORKDIR /home/babysitbot/Documents
RUN ln -sf /bin/bash /bin/sh
RUN useradd -ms /bin/bash babysitbot &&\
    chown -R babysitbot /home/babysitbot
USER babysitbot

# modules python neccessaires
COPY requirements.txt ./
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# fichiers indispensables du bot
COPY .env ./
COPY babysitBot.py ./

# entrypoint
ENTRYPOINT [ "python", "babysitBot.py" ]
