FROM ubuntu

MAINTAINER ty "xdtianyu@gmail.com"

RUN ln -s -f /bin/bash /bin/sh

RUN apt-get update && \
    apt-get install -y openssh-server sudo curl wget zip unzip vim virtualenv apache2-utils net-tools supervisor htop && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
    sudo apt-get update && \
    sudo apt-get install -y mongodb-org && \
    mkdir -p /opt/eve && \
    cd /opt/eve && \
    virtualenv -p python3 venv && \
    source venv/bin/activate && \
    pip install eve && \
    deactivate && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    mkdir -p /opt/adminMongo && cd /opt/adminMongo && \
    npm i admin-mongo@0.0.20 && \
    mkdir -p /opt/adminMongo/config && \
    mkdir -p /opt/mongo-express && cd /opt/mongo-express && \
    npm install mongo-express && \
    apt-get install -y nginx-extras && \
    rm /etc/nginx/sites-enabled/default && mkdir -p /var/www && \
    apt-get install -y build-essential libffi-dev libssl-dev python3-dev python-setuptools && \
    mkdir -p /opt/butterfly && cd /opt/butterfly && \
    virtualenv -p python3 venv && \
    source venv/bin/activate && pip install butterfly && deactivate \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    echo "root:root" | chpasswd

COPY admin-mongo/app.json /opt/adminMongo/config/app.json

COPY mongo-express/config.default.js /opt/mongo-express/node_modules/mongo-express/config.default.js

COPY eve/app.py /opt/eve/app.py

COPY nginx/backend /etc/nginx/sites-enabled/backend

COPY nginx/index.html /var/www/index.html

COPY nginx/.htpasswd /etc/nginx/.htpasswd

COPY ssh/sshd_config /etc/ssh/sshd_config

COPY supervisor/backend.conf /etc/supervisor/conf.d/backend.conf

COPY entrypoint.sh /opt

RUN chown -R nobody:nogroup /opt && chown -R www-data:www-data /var/log/nginx

# Set user
USER root

EXPOSE 80 22

ENTRYPOINT ["/opt/entrypoint.sh"]
