.DEFAULT_GOAL := test

.PHONY: down requirements test test-static

requirements:	## Install the requirements needed to run Cookiecutter
	pip install -r requirements.txt

test:	## Ensure we can build and run a new project
	# Remove any existing data
	rm -rf todo_project_name

	# Create a new project with the default values
	cookiecutter . --no-input

	# Execute the project's Make targets
	cd todo_project_name && make docker.build
	cd todo_project_name && make local.up
	sleep 5
	cd todo_project_name && docker exec -it todo_project_name.app make detect_missing_migrations
	cd todo_project_name && docker exec -it todo_project_name.app make migrate
	cd todo_project_name && docker exec -it todo_project_name.app make validate
	cd todo_project_name && make validate_terraform

test-static:	## Confirm nginx is serving static files
	curl -o /dev/null --fail --silent --compressed http://localhost:8080/static/admin/css/login.css

down:	## Shutdown the containers
	cd todo_project_name && make local.down
