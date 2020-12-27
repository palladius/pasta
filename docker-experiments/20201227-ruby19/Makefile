

docker-build:
	docker build -t palladius/ruby1.9  .

docker-run-info: docker-build
	echo Type: ruby --version
	docker run -it -p 3000:3000 palladius/ruby1.9 bash 


#ruby --version
#ruby 1.8.7 (2017-12-15 patchlevel 377) [x86_64-linux]