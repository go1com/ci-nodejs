FROM node:boron-alpine

# Install build package
RUN apk add --no-cache --virtual .build-deps \
	autoconf \
	automake \
	binutils-gold \
	build-base \
	curl \
	g++ \
	gcc \
	gnupg \
	libffi-dev \
	libstdc++ \
	libgcc \
	linux-headers \
	make \
&& apk add --no-cache \
	bash \
	ca-certificates \
	coreutils \
	curl \
	git \
	openssh-client \
	python \
	ruby \
	ruby-dev \
	ruby-io-console \
	tzdata \
&& echo 'gem: --no-document' > /etc/gemrc \
&& gem install --no-rdoc --no-ri compass foundation sass \
&& bash -c 'npm set progress=false' \
&& bash -c 'npm install -g yarn bower grunt-cli gulp-cli jira-cmd phantomjs-prebuilt utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess selenium-standalone webdriver-manager' \
&& selenium-standalone install --silent \
&& webdriver-manager update \
&& apk del .build-deps
