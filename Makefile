.DEFAULT_GOAL := test

.PHONY: requirements test

requirements:
	pip install -r requirements.txt
	# TODO Restore once https://github.com/pypa/pipenv/issues/3224 is released
	# pip install pipenv
	pip install git+https://github.com/pypa/pipenv

test:
	# Remove any existing data
	rm -rf todo_project_name

	# Create a new project with the default values
	cookiecutter . --no-input

	# Execute the project's Make targets
	cd todo_project_name && make production-requirements requirements
	cd todo_project_name && SECRET_KEY=fake DATABASE_URL="sqlite://:memory:" pipenv run make detect_missing_migrations
	cd todo_project_name && SECRET_KEY=fake DATABASE_URL="sqlite://:memory:" pipenv run make migrate
	cd todo_project_name && pipenv run make validate
	cd todo_project_name && pipenv run make static
