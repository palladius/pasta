
VERSION = $(shell cat VERSION)
# needed by my Linux machine at work :)
SHELL := /bin/bash
# note in skaffold its called differently..
MAKEFILE_DOCKER_IMAGE_NAME = pasta-ror7

help:
	cat Makefile

assets:
	rake assets:precompile

db-recreate-DANGEOURS:
	./destroy-and-recreate.sh

docker-build:
	docker build -t pasta-ror7:v$(VERSION) .

docker-run: docker-build
	docker run -it -p 8080:8080 pasta-ror7:v$(VERSION) ./entrypoint-8080.sh

macosx-docker-build:
	./docker-buildx-on-mac-m1.sh

# https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/
docker-push: docker-build
	# apologies this is a Riccardo only problem. 
	echo WARNING If you are on a arm64 Mac you will push BAD docker... FIXME.
	uname | grep Linux && echo 'OK Linux no probs of my Mac weird cross compiling.'
	# push latest version
	docker tag pasta-ror7:v$(VERSION) palladius/pastang:v$(VERSION)
	docker push palladius/pastang:v$(VERSION)
	# also pushes to LATEST..
	docker tag pasta-ror7:v$(VERSION) palladius/pastang
	docker push palladius/pastang

find-interesting-changes:
	echo These are things it took me a while to fix, and are important and hard to see changes..
	rgrep Ric2022 .

run-prod-directly:
	RAILS_ENV=production \
	 RICCARDO_SECRET_KEY_BASE=0a2780996c36bef4a8728d3676665a6f \
	 MESSAGGIO_OCCASIONALE="note this key is available to the whole world. Make sure if you have something interesting you find the time to change the ENV file :)" \
	 ./entrypoint-8080.sh

run-prod-docker: docker-build
	docker run -it -p 8080:8080 \
		--env RAILS_ENV=production \
		--env RICCARDO_SECRET_KEY_BASE=0a2780996c36bef4a8728d3676665a6f \
		--env MESSAGGIO_OCCASIONALE='This time I run the dockerized version with proper ENVs setup like this amazingly meaningful message' \
		pasta-ror7:v$(VERSION) ./entrypoint-8080.sh

kubectl-apply-prod:
	./kubectl-apply-to-prod.sh


get-skaffold-pods:
	kubectl get 'pod,deployment' | grep skpasta
	# servicepods
	echo Try also: ./test-app.sh
	make test-apps


test-apps:
	echo Testing load balancers
	./test-app.sh

verify: test-apps

.PHONY: pulumi

pulumi:
	make -C pulumi/pastang/ up
