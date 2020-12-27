

docker-build:
	docker build -t palladius/ruby1.8  .
docker-build-alternative:
	docker build -t palladius/ruby1.8alt - < Dockerfile.ru18ra2318
docker-build-pasta-from-septober:
	docker build -t palladius/ruby1.8sept - < Dockerfile.palladius-septober

docker-run-info: docker-build
	echo Type: ruby --version
	docker run -it -p 3000:3000 palladius/ruby1.8 bash 



docker-run-alternative-info: docker-build-alternative
	docker run -it -p 3000:3000 palladius/ruby1.8alt bash 

#ruby --version
#ruby 1.8.7 (2017-12-15 patchlevel 377) [x86_64-linux]