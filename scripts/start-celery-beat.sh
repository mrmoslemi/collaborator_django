#!/bin/bash

set -o errexit
set -o nounset

rm -f './celerybeat.pid'
celery -A momentum_django beat -l INFO --scheduler django_celery_beat.schedulers:DatabaseScheduler
#celery -A momentum_django worker --beat --scheduler django --loglevel=info
