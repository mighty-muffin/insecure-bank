.PHONY: help setup build test lint run docker docker-build docker-run docker-clean

IMAGE_NAME := insecure-bank-dotnet

help:
	@echo "Insecure Bank — .NET (ASP.NET Core 3.1)"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  setup         Restore NuGet packages"
	@echo "  build         Build the project"
	@echo "  test          Run tests (no tests configured)"
	@echo "  lint          No linter configured"
	@echo "  run           Start the application"
	@echo "  docker        Build and run the Docker container"
	@echo "  docker-build  Build the Docker image"
	@echo "  docker-run    Run the Docker container"
	@echo "  docker-clean  Stop and remove the container"

setup:
	dotnet restore

build: setup
	dotnet build --no-restore --configuration Release

test: build
	@echo "No test project configured. Skipping."

lint:
	@echo "No linter configured for .NET. Skipping."

run: setup
	dotnet run

docker: docker-clean docker-build docker-run

docker-build:
	docker build \
	  --file Dockerfile --no-cache --tag $(IMAGE_NAME) .

docker-clean:
	-docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME)

docker-run:
	docker run --detach --publish 8080:80 --name $(IMAGE_NAME) $(IMAGE_NAME)
