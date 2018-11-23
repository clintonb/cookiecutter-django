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
    && touch /logs/app.log \
    && touch /logs/gunicorn.log

ENV PUBLIC_ROOT /public
ENV LOG_FILE_PATH /logs
ENV ENABLE_LOGGING_TO_FILE true

VOLUME /public/media

EXPOSE 8000

ENTRYPOINT ["/app/{{ cookiecutter.project_slug }}/docker-entrypoint.sh"]
