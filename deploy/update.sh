#!/usr/bin/env bash

set -e

PROJECT_BASE_PATH='/usr/local/apps/profiles-rest-api'

cd $PROJECT_BASE_PATH
git pull
$PROJECT_BASE_PATH/env/bin/python manage.py migrate

# in case new dependencies are added that add any more static files
$PROJECT_BASE_PATH/env/bin/python manage.py collectstatic --noinput
supervisorctl restart profiles_api

echo "DONE! :)"
