POST_TITLE ?= default-title
POST_NAME ?= default-name

.PHONY: build clean post help

build:  ##Build your website
	hugo

clean:  ##Delete all the content inside dist directory
	rm -rf dist

post:  ##Create a new post with global variables where file name is POST_NAME and post title is POST_TITLE
	hugo new posts/$(POST_NAME).md
	sed -i 's/^title: .*/title: "'"${POST_TITLE}"'"/' content/posts/"${POST_NAME}".md

help:  ##Show this help usage
	cat Makefile | grep "##" | tr -d "##" | head -n -1
