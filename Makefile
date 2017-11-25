
tests:
	@echo "1. DB in developments contains pastas.. if not run rake dbLseed"
	echo 'Pasta.all.map{|x| x.name }' | script/console

install:
	sudo gem install -v=2.3.18 rails
	sudo gem install hobo
	rake db:migrate
	rake db:seed
	touch make_install.touch

prep:
	sudo apt install passenger
	rvm use --install 1.9.3 
	bundle install
	rake db:migrate
	rake db:seed
	touch prep
	
run: prep
	script/server

docker-run:
	sudo docker build -t riccpasta .
	sudo docker run --name riccardo-pasta -d riccpasta

