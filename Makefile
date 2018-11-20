.DEFAULT_GOAL := test

.PHONY: requirements test

requirements:
	pip install -r requirements.txt

test:
	# Remove any existing data
	rm -rf todo_project_name

	# Create a new project with the default values
	cookiecutter . --no-input

	# Execute the project's Make targets
	cd todo_project_name && make docker.build
	cd todo_project_name && make local.up
	cd todo_project_name && docker exec -it todo_project_name.app make detect_missing_migrations
	cd todo_project_name && docker exec -it todo_project_name.app make migrate
	cd todo_project_name && docker exec -it todo_project_name.app make validate
	cd todo_project_name && make local.down
