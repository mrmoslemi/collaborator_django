#!/bin/bash
git pull origin main
source .venv/bin/activate
python manage.py migrate
deactivate
mkdir /run/uwsgi/
mkdir /run/uwsgi/collaborator_django/
uwsgi --ini uwsgi_config.ini
