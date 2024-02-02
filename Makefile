.PHONY: docs

test:
	poetry run pytest -n auto --cov

ci-test:
	poetry run pytest

ci-coverage:
	poetry run pytest --cov --cov-report lcov

typing:
	tox -e typing

format:
	tox -e format

lint:
	tox -e lint

format-fix:
	poetry run ruff format .

lint-fix:
	poetry run ruff . --fix

dev-dependencies:
	poetry install --with dev --no-root

update-dependencies:
	poetry update --with dev

fix: lint-fix format-fix
check:
	poetry export -f requirements.txt --output /tmp/requirements.txt --with dev
	tox

docs:
	poetry run mkdocs serve
