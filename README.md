This proof of concept was created and deployed in two hours.
This makes me REALLY proud. All the rest is nothing.
The app itself is REALLY simple (and loads data from `seed.rb`).

At the moment, it is a matrix of possible PASTAs and SAUCEs.
Italians are not happy to put any sauce with any pasta, there is a matrix which is coded in our DNA
and non-italians simply have to learn the hard way, via this application for instance.

*NOTE*: From this app, you may infer trivially that [Spaghetti Bolognese dont exist](http://www.palladius.it/index.php?option=com_content&view=article&id=177:spaghetti-bolognese-dont-exist&catid=30:english-contents&Itemid=67)!

## Install

Make sure you are using `Ruby 1.8` and old Gems which still work with this Ruby/Hobo installation :/ (see `Dockerfile` for updates).

	cd /path/to/yourdir
	git clone https://github.com/palladius/pasta.git
	cd pasta
	make install

## Dockerization

Dockerizing my app offers a solution to finding how to run my application on bloody 1.8.7 / 2.3.18.
Unfortunately ruby 1.8 version doesnt exist (is not suppored / is hard to find) in Dockerhub.
Scraping oldest dockerhub versions I could find `1.9.3p551` as earliest version.

Some good readings to resuscitate old ruby versions:

* http://iwantmyreal.name/bringing-dead-projects-back-to-life-with-docker 
* https://stackoverflow.com/questions/53505250/running-ruby-1-8-7-in-docker

## Credits

- DHH for Rails
- Ryan Bates for Nifty stuff.
- HOBO people for creating Hobo (which actually Im starting to hate, but still I used extensively)
- [Pamela](https://www.facebook.com/pamela.emydio) for her patience that morning..
