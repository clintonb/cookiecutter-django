FROM python:3.6-alpine

WORKDIR /app/{{ cookiecutter.project_slug }}

ENV DJANGO_SETTINGS_MODULE {{ cookiecutter.project_slug }}.settings
ENV PUBLIC_ROOT /public/{{ cookiecutter.project_slug }}
ENV LOG_FILE_PATH /logs/{{ cookiecutter.project_slug }}
ENV PIPENV_DONT_USE_PYENV 1

RUN apk add --update \
    libffi-dev \
    gcc \
    make \
    musl-dev \
    postgresql-dev \
    python3-dev \
  && pip install pipenv \
  && rm -rf /var/cache/apk/*

COPY Makefile /app/{{ cookiecutter.project_slug }}
COPY Pipfile /app/{{ cookiecutter.project_slug }}
COPY Pipfile.lock /app/{{ cookiecutter.project_slug }}

RUN pipenv install --dev --system

COPY . /app/{{ cookiecutter.project_slug }}

RUN mkdir -p /logs/{{ cookiecutter.project_slug }}

#RUN make static

EXPOSE 8000
VOLUME /logs
VOLUME /public

ENV ENABLE_LOGGING_TO_FILE true
ENV GUNICORN_CMD_ARGS "--workers=2 --worker-class=gevent --bind=0.0.0.0:8000"
CMD ["gunicorn", "{{ cookiecutter.project_slug }}.wsgi"]
