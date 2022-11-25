
VERSION = $(shell cat VERSION)
# needed by my Linux machine at work :)
SHELL := /bin/bash

help:
	cat Makefile

db-recreate-DANGEOURS:
	./destroy-and-recreate.sh

docker-build:
	docker build -t pasta-ror7:v$(VERSION) .

docker-run: docker-build
	docker run -it -p 8080:8080 pasta-ror7:v$(VERSION)

docker-push: docker-build
	# push latest version
	docker tag pasta-ror7:v$(VERSION) palladius/pastang:v$(VERSION)
	docker push palladius/pastang:v$(VERSION)
	# also pushes to LATEST..
	docker tag pasta-ror7:v$(VERSION) palladius/pastang
	docker push palladius/pastang

find-interesting-changes:
	echo These are things it took me a while to fix, and are important and hard to see changes..
	rgrep Ric2022 .
