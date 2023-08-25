.DEFAULT_GOAL := help

.PHONY: help
help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: local-setup
local-setup: ## Set up the local environment (e.g. install git hooks)
	scripts/local-setup.sh

.PHONY: build
build: ## Build image
	docker build . -t aoc

.PHONY: check-format
check-format: ## Check format
	docker run -it -v .:/app --entrypoint rufo aoc -c .

.PHONY: test
test: ## Run all available tests
	docker run -v .:/app aoc

.PHONY: pre-commit
pre-commit: check-format test
