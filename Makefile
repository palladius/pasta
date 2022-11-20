
VERSION = $(shell cat VERSION)

help:
	cat Makefile

db-recreate-DANGEOURS:
	./destroy-and-recreate.sh

docker-build:
	docker build -t pasta-ror7:v$(VERSION) .

docker-run: docker-build
	docker run -it -p 8080:8080 pasta-ror7:v$(VERSION)

docker-push:
	# push latest version
	docker tag pasta-ror7:v$(VERSION) palladius/pastang:v$(VERSION)
	docker push palladius/pastang:v$(VERSION)
	# also pushes to LATEST..
	docker tag pasta-ror7:v$(VERSION) palladius/pastang
	docker push palladius/pastang

