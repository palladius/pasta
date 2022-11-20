
help:
	cat Makefile

db-recreate-DANGEOURS:
	./destroy-and-recreate.sh

docker-build:
	docker build -t pasta-ror7 .

docker-run: docker-build
	docker run -it -p 8080:8080 pasta-ror7
