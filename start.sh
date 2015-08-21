#!/bin/sh

# Creating Python Virtual Environments
echo "Creating Python Virtual Environments..."
cd /vagrant
virtualenv venv
source venv/bin/activate
pip install -r requirements.pip

# Setting pusher database for Django
cd pusher
python manage.py syncdb --noinput

# Preparing application
python manage.py collectstatic --noinput


# Start application
python manage.py runserver 0.0.0.0:8080 &
celery worker -A tasks --autoreload --loglevel=DEBUG &
node io-server.js &

echo "====================================="
echo "Visit http://localhost:8080/messages/"
echo "====================================="
echo "To create notifications execute: sh /vagrant/post-message.sh --message \"Hello World\" --level \"Moon\"