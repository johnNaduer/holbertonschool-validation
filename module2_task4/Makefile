SHELL := /bin/bash
POST_TITLE ?= default-title
POST_NAME ?= default-name

.PHONY: build clean post help check validate

check:  ## check content and links  of URLs
	@markdownlint content/posts/*.md
	@find content/**/*.md -exec markdown-link-check {} \;

validate: ## validate links in dist folder
	@python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html 2>&1 || true

build:  check ##Build your website
	@hugo

clean:  ##Delete all the content inside dist directory
	@rm -rf dist

post:  ##Create a new post with global variables where file name is POST_NAME and post title is POST_TITLE
	@hugo new posts/$(POST_NAME).md
	@sed -i 's/^title: .*/title: "'"${POST_TITLE}"'"/' content/posts/"${POST_NAME}".md

help:  ##Show this help usage
	@cat Makefile | grep "^[a-z][a-z\-]*:.*##.*" | sed 's/:.*## /: /'
