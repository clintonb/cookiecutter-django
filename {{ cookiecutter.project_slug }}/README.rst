{{cookiecutter.project_name}}  |Travis|_ |Codecov|_
===================================================
.. |Travis| image:: https://travis-ci.org/TODO/{{cookiecutter.project_slug}}.svg?branch=master
.. _Travis: https://travis-ci.org/TODO/{{cookiecutter.project_slug}}

.. |Codecov| image:: http://codecov.io/gh/TODO/{{cookiecutter.project_slug}}/branch/master/graph/badge.svg
.. _Codecov: http://codecov.io/gh/TODO/{{cookiecutter.project_slug}}

TODO The ``README.rst`` file should start with a brief description of the project.

Getting Started
---------------
1. Build the Docker container::

    make docker.build

2. Run the service locally, along with Nginx and PostgreSQL::

    make local.up


When running the service with this command, it will be configured to run using the code on your local machine,
rather than the code built in the previous step. Additionally, the `gunicorn <https://gunicorn.org/>`_ application
server has been configured to automatically reload when code is changed locally.

3. If you need to run commands inside the container, you can open a shell with the following command::

    make local.shell


How To Contribute
-----------------

TODO Describe how others can contribute to this project.
Contributions are welcome. Do this...

Reporting Security Issues
-------------------------

TODO Describe how people can report security issues.
Please do not report security issues in public. Please email...

Get Help
--------

TODO Describe where/how others can get support for running, or contributing to, this project.
Ask questions and discuss this project on Slack or a mailing list...
