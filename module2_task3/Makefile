SHELL := /bin/bash

lint:   ## Catch errors without the need to compile or execute the application
	@golangci-lint run

build:  lint  ## Compile the source code of the application to a binary
	@go build

run:    ## Run the application in background by executing the binary
	@./awesome-api >./awesome-api.log 2>&1 &

stop:   ## Stop the application
	@pkill awesome-api || true

clean: stop ## Stop the application. Delete the binary, log file, and coverage reports.
	@rm -f awesome-api awesome-api.log coverage-units.out coverage-integrations.out

test:   unit-tests integration-tests ## Run both unit and integration tests

unit-tests:   ## Run unit tests on web server
	@go test -v -short -coverprofile=coverage-units.out

integration-tests:   ## Run integration tests on web server
	@go test -v -coverprofile=coverage-integrations.out

help:   ## Show this help usage
	@cat Makefile | grep "^[a-z][a-z\-]*:.*##.*" | sed 's/:.*## /: /'
