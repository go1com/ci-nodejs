FROM ubuntu:trusty
MAINTAINER sang@go1.com.au

RUN apt-get install curl -y -qq && curl -sL https://deb.nodesource.com/setup_5.x | bash - && apt-get update -qq && apt-get upgrade -y && apt-get install -y -qq ruby-dev make nodejs python g++ build-essential python-software-properties git-core libfontconfig && apt-get clean && rm -rf /var/lib/apt/lists/*

# install compass
RUN gem install --no-rdoc --no-ri compass foundation sass

# install nodejs + tools
RUN bash -c 'npm install -g bower grunt-cli jira-cmd phantomjs-prebuilt utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess'
