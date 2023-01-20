#!/bin/bash

# copied/inspired by my `ror6-2020-goldie/entrypoint-8080.sh` under gprojects.

# This is a best practice entrypoint which does two things:
# 1. Preps this shitty ruby1.9 environment.
# 2. Is ready to execute other commands, (say rake db:migrate or something)

# First of all we source .env as we might need to override something.

#
# 2023-01-19 v0.6 added RAILS_ENV to first line.
#
#


source .env

ENTRYPOINT_VERSION="0.6"

VER="$(cat VERSION)"
MYPORT="${PORT:-8080}"
APP_NAME="${APPNAME:-entrypoint-sobenme}"


function lolcat() {
    cat "$@"
}

function verbose_echo() {
    echo "[ep8080]👾[$APP_NAME-v$VER] $(echo "$*" | lolcat)" | lolcat
}

verbose_echo "BEGIN. $0 called on MYPORT=$MYPORT RAILS_ENV=$RAILS_ENV and args: '$*'"

# added to dockerfile :)
verbose_echo "Doing a silly second bundle install if needed. this became evident AFTER I started caching bundles in vendor/bundle/. Local builds are lightning fast but target image is lacunary :/"
bundle config set --local path 'vendor/bundle'
bundle install


# if DEV or PROD we further source appropriate .env.$ENV if it exists.
if [ -f ".env.$RAILS_ENV" ]; then
    verbose_echo "EnvFile .env.$RAILS_ENV found! Sourcing it! Sluuuuurp!"
    source .env.$RAILS_ENV
else
    verbose_echo "EnvFile .env.$RAILS_ENV not found: no biggie. Skipping"
fi

if printenv RAILS_ENV | grep -q production ; then
    verbose_echo "Riccardo I believe this is PROD (RAILS_ENV=$RAILS_ENV). Lets *scagnozz the dogs* (in SeptoberVintage this implies running MySQL - if it hangs probably you sucked at populating connection variables. Fingers crossed)!"
    export RAILS_LOG_TO_STDOUT="yesplease"
    export RAILS_ENV="production"
    export RACK_ENV="production"
    export RAILS_SERVE_STATIC_FILES="true"

    # https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose
    if [ -f tmp/pids/server.pid ]; then
        rm tmp/pids/server.pid
    fi

    #RAILS_ENV=production pleonastic :)
    rails assets:precompile
    #source .env # Nope, already done my friend.
    #source .env
    #pleonastic as well
    #if [ -f .env.production ]; then
    #    source .env.production
    #fi
    #https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose
    # 17jan23: gives issue https://github.com/gilbarbara/react-joyride/issues/131
    yarn install --check-files


    # Lets try to REMOVE them to make start FASTER.
    # You can always call CMD "bundle install && bundle exec rake db:migrate" no wait you cant
    #bundle install
    rake tmp:clear # https://github.com/rails/sprockets-rails/issues/458
    #bundle exec rake db:migrate db:seed
    bundle exec rake db:migrate # no db:seed in prod..

    #bundle exec rails s -b 0.0.0.0 -p $MYPORT
else
    verbose_echo "Riccardo I believe this is DEV (RAILS_ENV=$RAILS_ENV). Still worth migrate/seed"
    #source .env # Nope, already done my friend.
    # TODO create and source .env.development
    #rake tmp:clear # https://github.com/rails/sprockets-rails/issues/458
    #rails assets:precompile
    # ERROR!!       > [skpasta-dev-7bc5b4577b-vrbv2 skpasta-dev] bundler: failed to load command: rake (/usr/local/bin/rake)
    bundle exec rake assets:precompile db:migrate db:seed
fi

if printenv 'ADDITIONAL_CMD1' ; then
    verbose_echo "wOOOt! ADDITIONAL_CMD1 provided. Executing before rails server: '$ADDITIONAL_CMD1'"
    exec "$ADDITIONAL_CMD1"
fi

# runs CMD commands BEFORE running.
verbose_echo "[BOTH DEV/PROD] Now Calling your custom Args script you gave me as CMD: '$*'"

"$@"

verbose_echo "And now finally calling rails server on port $MYPORT"
# runs on all IPs and port ~8080.
#which rails
bundle exec rails s -b 0.0.0.0 -p "$MYPORT"

echo "[$APP_NAME-v$VER-entrypoint] END. You should NEVER see this I guess,"
