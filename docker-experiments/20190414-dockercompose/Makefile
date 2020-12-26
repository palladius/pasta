
# image is empty so you HAVE to use volume (in septober the dqlite version is provided in a dir)

docker-build:
	docker build -t pasta-122-image .

run-postgre:
	docker-compose -f docker-compose-postgre.yaml run --rm web bundle install

run-mysql:
	docker-compose -f docker-compose-mysql.yaml run --rm web bundle install

docker-run-bash-p8081: docker-build
	docker run -it \
	 -p 8081:8081 \
	 -v ~/git/gcp-metarepo/pasta/:/opt/pasta-development/  \
	 pasta-122-image:latest \
	 bash