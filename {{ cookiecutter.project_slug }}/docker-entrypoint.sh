#!/bin/sh

mkdir -p /public/static
make migrate
make static

# Prepare log files and start outputting logs to stdout
touch /logs/app.log
touch /logs/gunicorn.log
tail -n 0 -f /logs/*.log &

echo Starting Gunicorn...
gunicorn {{ cookiecutter.project_slug }}.wsgi \
    --workers=2 \
    --worker-class=gevent \
    --bind=0.0.0.0:8000 \
    --log-file=/logs/gunicorn.log \
    "$@"
