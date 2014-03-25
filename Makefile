
install:
	sudo gem install -v=2.3.5 rails
	sudo gem install hobo
	rake db:migrate
	rake db:seed
	touch make_install.touch

