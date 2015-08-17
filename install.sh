#!/bin/sh

# Updating OS
echo "Updating OS..."
apt-get -qqy update
apt-get -qqy upgrade

# Installing general dependencies
echo "Installing general dependencies..."
apt-get -qqy install build-essential automake software-properties-common


# Installing RabbitMQ server
echo "Installing RabbitMQ server..."
cd /tmp
add-apt-repository "deb http://www.rabbitmq.com/debian/ testing main"
wget -q https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc
apt-get -qqy update
apt-get -qqy install rabbitmq-server

# Installing MariaDB
echo "Installing MariaDB..."
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository "deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/debian jessie main"
apt-get -qqy update
echo "mysql-server mysql-server/root_password password pusher123abc" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password pusher123abc" | sudo debconf-set-selections
apt-get -qqy install mariadb-server libmariadbclient-dev

# Installing Git
echo "Installing Git..."
apt-get -qqy install git

# Installing Node.JS
echo "Installing Node.JS..."
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
apt-get -qqy install nodejs

# Installing Python toys
echo "Installing Python toys..."
apt-get -qqy install python-virtualenv python-dev python-setuptools

# Installing watchman
echo "Installing watchman..."
cd /tmp
git clone https://github.com/facebook/watchman.git
cd watchman
./autogen.sh
./configure
make
make install

# Installing Ember.JS
echo "Installing Ember.JS..."
cd /vagrant
npm install -g ember-cli

# Creating database
echo "Creating database..."
mysql --user="root" --password="pusher123abc" --execute="CREATE DATABASE pusher CHARACTER SET utf8;"
mysql --user="root" --password="pusher123abc" --execute="GRANT ALL PRIVILEGES ON pusher.* TO \"pusher\"@\"localhost\" IDENTIFIED BY \"pusher123abc\"";
