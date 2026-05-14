.PHONY: help setup build test lint run docker docker-build docker-run docker-clean

IMAGE_NAME := insecure-bank-python

help:
	@echo "Insecure Bank — Python (Django)"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  setup         Create venv and install dependencies"
	@echo "  build         Build the package wheel"
	@echo "  test          Run the test suite"
	@echo "  lint          Run ruff linter and format check"
	@echo "  run           Migrate and start the dev server"
	@echo "  docker        Build and run the Docker container"
	@echo "  docker-build  Build the Docker image"
	@echo "  docker-run    Run the Docker container"
	@echo "  docker-clean  Stop and remove the container"

setup:
	uv venv .venv --python 3.10 --clear
	uv sync --all-extras --all-packages

build:
	uv build

test:
	uv run pytest

lint:
	uv run ruff check
	uv run ruff format --check

run:
	uv run python src/manage.py migrate
	uv run python src/manage.py check
	uv run python src/manage.py runserver

docker: docker-clean docker-build docker-run

docker-build:
	docker build \
	  --build-arg GIT_COMMIT=$(shell git rev-parse --short HEAD) \
	  --build-arg REPO_URL=$(shell git config --get remote.origin.url | sed 's/git@/https:\/\//; s/.com:/.com\//; s/\.git$$//') \
	  --file Dockerfile --no-cache --tag $(IMAGE_NAME) .

docker-clean:
	-docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME)

docker-run:
	docker run --detach --publish 8000:8000 --name $(IMAGE_NAME) $(IMAGE_NAME)
