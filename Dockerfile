FROM ruby:2.3.3
# change to bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN mkdir /myapp2
RUN npm install -g bower

# install phantomjs 2.1.1
RUN export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
RUN cd ~ && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
#RUN cd ~ && bzip2 -d phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN cd ~ && tar -xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv ~/phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin

# Rails app setup.
# Need to have already created a blank Gemfile.lock
# Need an intial Gemfile with gem "rails" "4.2.1"
WORKDIR /myapp2
ADD Gemfile /myapp2/Gemfile
ADD Gemfile.lock /myapp2/Gemfile.lock
RUN bundle install
ADD . /myapp2
