
tests:
	@echo "1. DB in developments contains pastas.. if not run rake dbLseed"
	echo 'Pasta.all.map{|x| x.name }' | script/console

install:
	sudo gem install -v=2.3.18 rails
	sudo gem install hobo -v 1.0
	sudo gem install will_paginate -v 2.3.11
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

# This is only iomportant within the Docker image.. for quick installation. Ignore this on parent world.
# You need to see Inception to get this :)
install-within-docker:
	apt -y install vim git 
	ln -s /root/.rbenv/versions/1.8.7-p375/bin/bundle /usr/bin/
