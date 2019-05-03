
build:
	docker build -t pasta-122-image .

run-postgre:
	docker-compose -f docker-compose-postgre.yaml run --rm web bundle install

run-mysql:
	docker-compose -f docker-compose-mysql.yaml run --rm web bundle install