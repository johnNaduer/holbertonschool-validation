SHELL := /bin/bash

lint:   ## Catch errors without the need to compile or execute the application
	@golangci-lint run

build:  lint  ## Compile the source code of the application to a binary
	@go build

run:    ## Run the application in background by executing the binary
	@./awesome-api >./awesome-api.log 2>&1 &

stop:   ## Stop the application
	@pkill awesome-api || true

clean: stop ## Stop the application. Delete the binary and the log file:
	@rm -f awesome-api awesome-api.log

test:   ## Ensure that it behaves as expected
	@curl http://localhost:9999
	@curl http://localhost:9999/health

help:   ## Show this help usage
	@cat Makefile | grep "^\w*:.*##.*" | sed 's/:.*## /: \t/'
