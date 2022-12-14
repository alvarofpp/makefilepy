# Variables
PACKAGE_NAME=makefilepy
ROOT=$(shell pwd)

## Lint
DOCKER_IMAGE_LINTER=alvarofpp/python:linter
LINT_COMMIT_TARGET_BRANCH=origin/main

## Test
TEST_CONTAINER_NAME=${PACKAGE_NAME}_test
TEST_COMMAND=pytest --cov=${PACKAGE_NAME} tests/

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: build
build: install-hooks
	@docker-compose build --pull

.PHONY: build-no-cache
build-no-cache: install-hooks
	@docker-compose build --no-cache --pull

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-yaml \
		&& lint-python"

.PHONY: shell
shell:
	@docker-compose run --rm ${PACKAGE_NAME} bash

.PHONY: test
test:
	@docker run --rm -v ${ROOT}:/app \
		--name ${TEST_CONTAINER_NAME} ${PACKAGE_NAME} \
		${TEST_COMMAND}

.PHONY: test-coverage
test-coverage:
	@docker run --rm -v ${ROOT}:/app \
		--name ${TEST_CONTAINER_NAME} ${PACKAGE_NAME} \
		/bin/bash -c "${TEST_COMMAND} && coverage report -m"
