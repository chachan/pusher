#/bin/bash

# Updating OS
echo "Updating OS..."
apt-get update
apt-get dist-upgrade

# Installing general dependencies
echo "Installing general dependencies..."
apt-get install build-essential automake


# Installing RabbitMQ server
echo "Installing RabbitMQ server..."
cd /tmp
add-apt-repository "deb http://www.rabbitmq.com/debian/ testing main"
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc
apt-get update
aptget install rabbitmq-server

# Installing MariaDB
echo "Installing MariaDB..."
apt-get install software-properties-common
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/debian jessie main'
apt-get update
apt-get install mariadb-server libmariadbclient-dev

# Installing Git
echo "Installing Git..."
apt-get install git

# Installing Node.JS
echo "Installing Node.JS..."
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
apt-get install nodejs

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
npm install -g ember-cl

# Installing Python toys
echo "Installing Python toys..."
apt-get install python-virtualenv python-dev

# Cloning repository
echo "Cloning repository..."
git clone 

# Creating Python Virtual Environments
echo "Creating Python Virtual Environments..."
cd /vagrant
virtualenv venv
source venv/bin/activate
pip install -r requirements.pip
