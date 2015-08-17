
# Creating Python Virtual Environments
echo "Creating Python Virtual Environments..."
cd /vagrant
virtualenv venv
source venv/bin/activate
pip install -r requirements.pip

# Setting pusher database for Django
cd pusher
python manage.py syncdb --noinput
python manage.py runserver 0.0.0.0:8080