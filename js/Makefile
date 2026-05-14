.PHONY: help setup build test lint run docker docker-build docker-run docker-clean

IMAGE_NAME := insecure-bank-js

help:
	@echo "Insecure Bank — Node.js (Express)"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  setup         Install npm dependencies"
	@echo "  build         No-op (no build step required)"
	@echo "  test          Run lint and format checks"
	@echo "  lint          Run ESLint and Prettier"
	@echo "  run           Start the application"
	@echo "  docker        Build and run the Docker container"
	@echo "  docker-build  Build the Docker image"
	@echo "  docker-run    Run the Docker container"
	@echo "  docker-clean  Stop and remove the container"

setup:
	npm ci

build:
	@echo "No build step required for Node.js."

test: lint

lint:
	npm run lint:check
	npm run format:check

run:
	npm start

docker: docker-clean docker-build docker-run

docker-build:
	docker build \
	  --build-arg GIT_COMMIT=$(shell git rev-parse --short HEAD) \
	  --file Dockerfile --no-cache --tag $(IMAGE_NAME) .

docker-clean:
	-docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME)

docker-run:
	docker run --detach --publish 3000:3000 --name $(IMAGE_NAME) $(IMAGE_NAME)
