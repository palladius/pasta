#!/bin/bash

# This is a best pracice entrypoint which does two things:
# 1. Preps this shitty ruby1.9 environment.
# 2. Is ready to execute other commands, (say rake db:migrate or something)

# First of all we source .env as we might need to override something.
source .env

VER="$(cat VERSION)"
MYPORT="${PORT:-8080}"
APP_NAME="${APPNAME:-entrypoint-sobenme}"
ENTRYPOINT_VERSION="0.4"

function verbose_echo() {
    echo "[ep8080][$APP_NAME-v$VER] $(echo "$*" | lolcat)" | lolcat

}

verbose_echo "BEGIN. $0 called on MYPORT=$MYPORT and args: '$*'"

# if DEV or PROD we further source appropriate .env.$ENV if it exists.
if [ -f ".env.$RAILS_ENV" ]; then
    verbose_echo "EnvFile .env.$RAILS_ENV found! Sourcing it! Sluuuuurp!"
    source .env.$RAILS_ENV
else
    verbose_echo "EnvFile .env.$RAILS_ENV not found: no biggie. Skipping"
fi 
    
if printenv RAILS_ENV | grep -q production ; then
    verbose_echo "Riccardo I believe this is PROD (RAILS_ENV=$RAILS_ENV). Lets scagnozz the dogs (in SeptoberVintagse this implies running MySQL - if it hangs probably you sucked at populating connection variables. Fingers crossed)!"
    export RAILS_LOG_TO_STDOUT=yesplease 
    export RAILS_ENV=production
    export RACK_ENV production

    #source .env # Nope, already done my friend.
    #source .env
    #pleonastic as well
    #if [ -f .env.production ]; then
    #    source .env.production
    #fi 

    # Lets try to REMOVE them to make start FASTER. 
    # You can always call CMD "bundle install && bundle exec rake db:migrate" no wait you cant
    #bundle install
    #bundle exec rake db:migrate

    #bundle exec rails s -b 0.0.0.0 -p $MYPORT
else
    verbose_echo "Riccardo I believe this is DEV (RAILS_ENV=$RAILS_ENV)"
    #source .env # Nope, already done my friend.
    # TODO create and source .env.development
fi

if printenv ADDITIONAL_CMD1; then
    verbose_echo "wOOOT! ADDITIONAL_CMD1 provided. Executing before rails server: '$ADDITIONAL_CMD1'"
    exec $ADDITIONAL_CMD1
fi 

# runs CMD commands BEFORE running.
verbose_echo "Now Calling your custom Args script you gave me as CMD: '$*'"
"$@"

verbose_echo "And now finally calling rails server on port $MYPORT"
# runs on all IPs and port ~8080.
bundle exec rails s -b 0.0.0.0 -p $MYPORT

echo "[$APP_NAME-v$VER-entrypoint] END. You should NEVER see this I guess,"
