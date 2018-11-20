FROM python:3.6-alpine

WORKDIR /app/{{ cookiecutter.project_slug }}

ENV DJANGO_SETTINGS_MODULE {{ cookiecutter.project_slug }}.settings
ENV PIPENV_DONT_USE_PYENV 1

RUN apk add --update \
    coreutils \
    gcc \
    libffi-dev \
    make \
    musl-dev \
    postgresql-dev \
    python3-dev \
  && pip install pipenv \
  && rm -rf /var/cache/apk/*

COPY Makefile /app/{{ cookiecutter.project_slug }}
COPY Pipfile /app/{{ cookiecutter.project_slug }}
COPY Pipfile.lock /app/{{ cookiecutter.project_slug }}

# TODO Switch to environment variable when https://github.com/pypa/pipenv/issues/3278 is resolved.
RUN pipenv install --dev --system

COPY . /app/{{ cookiecutter.project_slug }}

RUN mkdir -p /logs \
    && touch /logs/app.log

ENV PUBLIC_ROOT /public
RUN make static

EXPOSE 8000

VOLUME /public/media
VOLUME /public/static


ENV LOG_FILE_PATH /logs
ENV ENABLE_LOGGING_TO_FILE true
ENV GUNICORN_CMD_ARGS "--workers=2 --worker-class=gevent --bind=0.0.0.0:8000"
CMD ["gunicorn", "{{ cookiecutter.project_slug }}.wsgi"]
