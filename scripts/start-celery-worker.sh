#!/bin/bash

set -o errexit
set -o nounset

celery -A momentum_django worker -l INFO --concurrency=10 -n worker1@%h
#celery -A momentum_django worker -l INFO --concurrency=10 -n worker1@%h && celery -A momentum_django worker -l INFO --concurrency=10 -n worker2@%h

#-P solo
#celery multi start 4 -A momentum_django -l INFO