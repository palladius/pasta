This proof of concept was created and deployed in two hours.
This makes me REALLY proud. All the rest is nothing.
The app itself is REALLY simple (and loads data from `seed.rb`).

At the moment, it is a matrix of possible PASTAs and SAUCEs.
Italians are not happy to put any sauce with any pasta, there is a matrix which is coded in our DNA
and non-italians simply have to learn the hard way, via this application for instance.

*NOTE*: From this app, you may infer trivially that [Spaghetti Bolognese dont exist](http://www.palladius.it/joomla/index.php?option=com_content&view=article&id=177:spaghetti-bolognese-dont-exist&catid=30:english-contents&Itemid=67)!

Install
=======

	cd /path/to/yourdir
	git clone https://github.com/palladius/pasta.git
	cd pasta
	rake db:migrate
	rake db:seed
	
	
Credits
-------

-	DHH for Rails
-	Ryan Bates for Nifty stuff.
-	HOBO people for creating Hobo (which actually Im starting to hate, but still I used extensively)
- [Pamela](https://www.facebook.com/pamela.emydio) for her patience that morning..
