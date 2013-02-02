
install:
	sudo gem install -v=2.3.5 rails
	rake db:migrate
	rake db:seed

