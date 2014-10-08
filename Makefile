
install:
	sudo gem install -v=2.3.18 rails
	sudo gem install hobo
	rake db:migrate
	rake db:seed
	touch make_install.touch

docker-run:
	sudo docker build -t riccpasta .
	sudo docker run --name riccardo-pasta -d riccpasta
