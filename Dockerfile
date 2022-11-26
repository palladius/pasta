FROM ruby:3.1.2-slim
#FROM ruby:3.1.2

# HAs Ubumntu, ruby1.8, ... and I trust the guy who built it :P
#FROM palladius/septober:v1.2


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
    npm \
    ssh \
 && rm -rf /var/lib/apt/lists/*

# install YARN through NPM. 
## alternatvely: curl -o- -L https://yarnpkg.com/install.sh | bash
RUN npm install --global yarn

ENV APP_HOME /opt/pasta

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# change to . if you move Dockerfile to /
ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME

ENV GEM_HOME /opt/pasta/vendor/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_BIN $BUNDLE_PATH/bin
ENV DESCRIPTION "This experiment was tried in 2019. Not sure it works today"

# This doesnt work!!
RUN gem install bundler
# https://stackoverflow.com/questions/52051122/cant-find-gem-railties-0-a-with-executable-rails-gemgemnotfoundexceptio
RUN bundle install --path vendor/bundle
# or try: RUN bundle check || bundle install
# Then I add the rest
ADD . $APP_HOME


# See from MAkefile: hobo should work both 1.1.0 and 1.0.0 maybe also 1.3.0: https://rubygems.org/gems/hobo/versions
#RUN gem install hobo 1.1.0
#RUN gem install -v=2.3.18 rails
#RUN gem install will_paginate -v 2.3.11
#RUN gem install sqlite3-ruby -v 1.2.5

EXPOSE 8080

# ./entrypoint-8080.sh doesnt work as requires lolcat
#ENTRYPOINT [ "rails", "s", "-p", "8080" ]
ENTRYPOINT [ "./entrypoint-8080.sh"] 

CMD ["/bin/bash"]

#CMD ["echo", "Ciao a tutti. Change CMD if you want to run bash or something.." ]
