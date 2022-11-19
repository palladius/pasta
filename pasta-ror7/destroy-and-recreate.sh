#!/bin/bash

set -e
set -x

rake db:drop
	bin/rails db:environment:set RAILS_ENV=development
	rake db:migrate
	rake db:seed
