FROM ubuntu:xenial

RUN apt-get update -qq \
    && apt-get install curl -y -qq \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get upgrade -y \
    && apt-get install -y -qq ruby-dev make nodejs python g++ build-essential python-software-properties git-core libfontconfig gettext default-jre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install compass
RUN gem install --no-rdoc --no-ri compass foundation sass

# install nodejs + tools
RUN bash -c 'npm set progress=false' \
    && bash -c 'npm install -g bower yarn grunt-cli gulp-cli jira-cmd phantomjs-prebuilt utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess selenium-standalone webdriver-manager imagemin imagemin-gifsicle imagemin-jpegtran imagemin-optipng imagemin-pngquant optipng-bin jpegtran-bin newman' \
    && selenium-standalone install --silent \
    && webdriver-manager update
