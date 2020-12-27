FROM ubuntu:14.04

# ruby-bundler added by riccardo
RUN apt-get install -y software-properties-common && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -y ruby1.8 rubygems1.8 ruby-switch ruby-bundler
RUN ruby-switch --set ruby1.8
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# Configure Bundler to install everything globally
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH

# Riccardo part..
#RUN gem install rake -v 0.8.7
#RUN apt-get install -y ruby-bundler
#RUN gem install bundler 
#RUN bundle config --global path "$GEM_HOME" && \
#    bundle config --global bin "$GEM_HOME/bin"

ENV BUNDLE_APP_CONFIG $GEM_HOME

ADD . /app/
WORKDIR /app

#CMD [ "irb" ]
CMD [ "./ruby-info.sh" ]