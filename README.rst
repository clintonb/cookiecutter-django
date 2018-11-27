Cookiecutter Django |Travis|_
=============================
.. |Travis| image:: https://travis-ci.org/clintonb/cookiecutter-django.svg?branch=master
.. _Travis: https://travis-ci.org/clintonb/cookiecutter-django


This project is a `Cookiecutter <https://cookiecutter.readthedocs.io/en/latest/>`_ template for Django projects. It is
intentionally lighter than more popular templates to allow for future flexibility.

Features
--------
* Django 2.1.x
* Support for Python 3.6+
* `12-Factor <https://12factor.net/>`_ based settings via `django-environ <https://django-environ.readthedocs.io/en/latest/>`_
* Custom user model
* Docker support
* Terraform for infrastructure configuration
* Deployment to AWS Elastic Beanstalk


Usage
-----
1. Install Cookiecutter::

    $ pip install cookiecutter

2. Run Cookiecutter, and enter details when prompted::

    $ cookiecutter https://github.com/clintonb/cookiecutter-django

3. Fill in the various ``TODO`` items with your project's details:

- README sections:

  - Badge URLs
  - Contributing
  - Security
  - Getting Help

- Docker image name
- Travis environment variables
- Terraform

  - Secure variables
  - State bucket name
