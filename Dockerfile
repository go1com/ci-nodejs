FROM ubuntu:xenial
ENV USER=root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq \
    && apt-get install openssh-client curl ca-certificates apt-utils -y -qq \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list \
    && apt-get update -qq \
    && apt-get install -y -qq ruby-dev make nodejs python g++ build-essential python-software-properties git-core libnss3 libfontconfig gettext default-jre google-chrome-beta chromium-chromedriver firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install compass
RUN gem install --no-rdoc --no-ri compass foundation sass

# install nodejs + tools
RUN npm config set -g progress false \
    && npm install -g --unsafe-perm bower yarn @angular/cli grunt-cli gulp-cli jira-cmd phantomjs-prebuilt utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess selenium-standalone webdriver-manager imagemin imagemin-gifsicle imagemin-jpegtran imagemin-optipng imagemin-pngquant optipng-bin jpegtran-bin newman nightmare mocha serverless serverless-webpack webpack node-sass typescript uglify-js \
    && yarn global add npm --silent \
    && selenium-standalone install --silent \
    && webdriver-manager update
