FROM ubuntu:14.04

RUN apt-get install -y software-properties-common && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -y ruby1.8 rubygems1.8 ruby-switch
RUN ruby-switch --set ruby1.8
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# Configure Bundler to install everything globally
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH

RUN gem install bundler && \
    bundle config --global path "$GEM_HOME" && \
    bundle config --global bin "$GEM_HOME/bin"

ENV BUNDLE_APP_CONFIG $GEM_HOME

CMD [ "irb" ]