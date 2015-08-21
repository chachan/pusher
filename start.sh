#!/bin/sh

cd /vagrant

# Installing socket.io
echo "Installing socket.io..."
npm install socket.io

# Installing amqplib
echo "Installing amqplib..."
npm install amqplib

# Creating Python Virtual Environments
echo "Creating Python Virtual Environments..."
virtualenv venv
venv/bin/pip install -r requirements.pip

# Setting pusher database for Django
cd pusher
../venv/bin/python manage.py syncdb --noinput
../venv/bin/python manage.py migrate --fake

# Preparing application
../venv/bin/python manage.py collectstatic --noinput

# Start application
../venv/bin/celery worker -A tasks --autoreload --loglevel=DEBUG &
node io-server.js &