

docker-build:
	docker build -t palladius/ruby1.8  .

docker-run-info: docker-build
	echo Type: ruby --version
	docker run -it -p 3000:3000 palladius/ruby1.8 bash 


docker-build-alternative:
	docker build -t palladius/ruby1.8alt - < Dockerfile.ru18ra2318

docker-run-alternative-info: docker-build-alternative
	docker run -it -p 3000:3000 palladius/ruby1.8alt bash 

#ruby --version
#ruby 1.8.7 (2017-12-15 patchlevel 377) [x86_64-linux]