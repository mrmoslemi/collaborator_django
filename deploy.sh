#!/bin/bash
git pull origin main
source .venv/bin/activate
python manage.py migrate
deactivate
mkdir /run/uwsgi/
mkdir /run/uwsgi/collaborator_django/
rm -f /run/uwsgi/collaborator_django/collaborator_django.sock
mkdir /var/log/uwsgi/
touch /var/log/uwsgi/collaborator_django.log
sudo uwsgi --ini uwsgi_config.ini
sudo systemctl restart nginx