
APPNAME = septober-vintage-vol2
VERSION = $(shell cat DOCKERIZE_VERSION )


clone: septober-github-copy#
#	@echo Its 63MB I can still tolerate a dupe..
	green "NO NEED TO CLONE BRO! Let's consolidate"

septober-github-copy:
	echo NO NEED TO CLONE BRO!
	#git clone git@github.com:palladius/septober.git septober-github-copy/
	ln -sf ../../Dockerfile ./Dockerfile-copy 

docker-build: clone
	docker build -t $(APPNAME):v$(VERSION) ../../
	#docker run
	echo Built $(APPNAME):v$(VERSION) my dear.

# this works!
docker-run-oldway-WORKS: docker-build
	echo Camomile yourself: this works.
	docker run -it -p 8080:8080 $(APPNAME):v$(VERSION) ./entrypoint-8080.sh

docker-run-volume: docker-build
	#docker run -it -p 8080:8080 $(APPNAME):v$(VERSION) bash
	#@echo Also exposing 3306 from outside to inside for mysql tests..
	@yellow Riccardo Remember to switch to another non default dir: /var/www-public/02-septober-vintage-volume-singlerepo/
	docker run -it -p 8080:8080  \
	    -v /home/riccardo/git/gcp-metarepo/septober/:/var/www-public/02-septober-vintage-volume-singlerepo/ \
	 	$(APPNAME):v$(VERSION) \
	 	bash

docker-run-volume-prod: docker-build
	@yellow To run this you need to have a .env.prod configured with values to your prod MYSQL DB. Copy and edit the .dist if you struggle.
	docker run -it -p 8080:8080  \
		--env-file /home/riccardo/git/gcp-metarepo/septober/.env.production \
	    -v /home/riccardo/git/gcp-metarepo/septober/:/var/www-public/02-septober-vintage-volume-singlerepo/ \
	 	$(APPNAME):v$(VERSION) \
	 	bash


docker-push:
	rosso Camomilize a bit bro. You dont want to do this.