# Insecure Bank — Monorepo
# Each project lives in its own subdirectory: python/ js/ dotnet/ java-mvn/
# Delegate per-project work with: make <project>-<target>
# Run combined operations with:   make <target>

PROJECTS := python js dotnet java-mvn

# Only declare combined targets as .PHONY — declaring per-project pattern targets
# (e.g. js-build) here would create empty explicit rules that shadow the js-% patterns.
.PHONY: help all setup build test lint docker

help:
	@echo "Insecure Bank Monorepo"
	@echo ""
	@echo "Usage: make [<project>-]<target>"
	@echo ""
	@echo "Projects: python | js | dotnet | java-mvn"
	@echo ""
	@echo "Per-project targets (prefix with '<project>-'):"
	@echo "  setup         Install / restore dependencies"
	@echo "  build         Compile / build the project"
	@echo "  test          Run the test suite"
	@echo "  lint          Run linter / formatter check"
	@echo "  run           Start the application locally"
	@echo "  docker        Build and run the Docker container"
	@echo "  docker-build  Build the Docker image only"
	@echo "  docker-run    Run the Docker container"
	@echo "  docker-clean  Stop and remove the container"
	@echo ""
	@echo "Combined targets (run for all projects):"
	@echo "  make all      setup + build + test all projects"
	@echo "  make setup    Install dependencies for all projects"
	@echo "  make build    Build all projects"
	@echo "  make test     Test all projects"
	@echo "  make lint     Lint all projects"
	@echo "  make docker   Build and run containers for all projects"
	@echo ""
	@echo "Examples:"
	@echo "  make python-test      # run Python tests only"
	@echo "  make js-setup         # install Node.js dependencies"
	@echo "  make dotnet-docker    # build and run the .NET container"
	@echo "  make test             # run tests for every project"

# ── Combined targets ──────────────────────────────────────────────────────────

all:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: setup + build + test"; \
	  $(MAKE) -C $$p setup build test || exit 1; \
	done

setup:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: setup"; \
	  $(MAKE) -C $$p setup || exit 1; \
	done

build:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: build"; \
	  $(MAKE) -C $$p build || exit 1; \
	done

test:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: test"; \
	  $(MAKE) -C $$p test || exit 1; \
	done

lint:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: lint"; \
	  $(MAKE) -C $$p lint || exit 1; \
	done

docker:
	@for p in $(PROJECTS); do \
	  echo "▶ $$p: docker"; \
	  $(MAKE) -C $$p docker || exit 1; \
	done

# ── Per-project delegating targets ───────────────────────────────────────────

python-%:
	$(MAKE) -C python $*

js-%:
	$(MAKE) -C js $*

dotnet-%:
	$(MAKE) -C dotnet $*

java-mvn-%:
	$(MAKE) -C java-mvn $*
