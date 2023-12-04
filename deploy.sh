#!/bin/bash
git pull origin main
source .venv/bin/activate
python manage.py migrate
deactivate
mkdir /run/uwsgi/
mkdir /run/uwsgi/collaborator_django/
mkdir /var/log/uwsgi/
touch /var/log/uwsgi/collaborator_django.log
sudo uwsgi --ini uwsgi_config.ini
sudo systemctl restart nginx