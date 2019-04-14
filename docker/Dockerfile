FROM ruby:2.3-slim

RUN apt-get update \
 && apt-get install -qq -y --no-install-recommends \
    build-essential \
    nodejs \
    libpq-dev \
    git \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    ssh \
 && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /opt/pasta

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENV GEM_HOME /opt/pasta/vendor/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_BIN $BUNDLE_PATH/bin

