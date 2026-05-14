.PHONY: help setup build test lint run docker docker-build docker-run docker-clean

IMAGE_NAME := insecure-bank-java

help:
	@echo "Insecure Bank — Java (Docker-only)"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  docker        Build and run the Docker container"
	@echo "  docker-build  Build the Docker image"
	@echo "  docker-run    Run the Docker container"
	@echo "  docker-clean  Stop and remove the container"
	@echo ""
	@echo "Note: this project ships a pre-built JAR; compile/test targets"
	@echo "      are not available."

# No Java source — the image wraps a pre-built JAR.
setup build test lint run:
	@echo "'$@' is not available for the Java project (Docker-only)."

docker: docker-clean docker-build docker-run

docker-build:
	docker build \
	  --file Dockerfile --no-cache --tag $(IMAGE_NAME) .

docker-clean:
	-docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME)

docker-run:
	docker run --detach --publish 8080:8080 --name $(IMAGE_NAME) $(IMAGE_NAME)
