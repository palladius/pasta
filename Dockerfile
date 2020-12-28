#FROM ruby:2.3-slim
#FROM ruby:1.8
#FROM hublogix/minimal-ruby

# HAs Ubumntu, ruby1.8, ... and I trust the guy who built it :P
FROM palladius/septober:v1.2


RUN apt-get update \
 && apt-get install -qq -y --no-install-recommends \
    build-essential \
    nodejs \
    libpq-dev \
    git \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    libsqlite3-dev \
    ssh \
 && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /opt/pasta

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# change to . if you move Dockerfile to /
ADD . $APP_HOME

# This doesnt work!!
#RUN bundle install

ENV GEM_HOME /opt/pasta/vendor/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_BIN $BUNDLE_PATH/bin
ENV DESCRIPTION "This experiment was tried in 2019. Not sure it works today"

# See from MAkefile: hobo should work both 1.1.0 and 1.0.0 maybe also 1.3.0: https://rubygems.org/gems/hobo/versions
RUN gem install hobo 1.1.0
#RUN gem install -v=2.3.18 rails
RUN gem install will_paginate -v 2.3.11
RUN gem install sqlite3-ruby -v 1.2.5

EXPOSE 8080

# ./entrypoint-8080.sh doesnt work as requires lolcat
ENTRYPOINT [ "script/server", "-p", "8080" ]

CMD ["echo", "Ciao a tutti. Change CMD if you want to run bash or something.." ]
