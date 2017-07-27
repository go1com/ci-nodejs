FROM node:alpine

ENV MODULES_DEPS ruby-dev libffi-dev

RUN set -xe \
    && apk add --no-cache --update -q ruby automake bash git nasm openssh-client chromium build-base autoconf zlib zlib-dev libpng libpng-dev libjpeg-turbo libjpeg-turbo-dev gettext \
    && apk add --no-cache --update --virtual .gem-deps $MODULES_DEPS \
    && npm config set -g progress false \
    && yarn config set yarn-offline-mirror /cache/npm-packages-offline-cache \
    && yarn global add -s bower @angular/cli grunt-cli gulp-cli jira-cmd utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess imagemin imagemin-gifsicle imagemin-jpegtran imagemin-optipng imagemin-pngquant optipng-bin jpegtran-bin mocha serverless serverless-webpack webpack node-sass typescript uglify-js \
    && gem install -q --no-rdoc --no-ri compass foundation sass \
    && rm -rf /cache/npm-packages-offline-cache \
    && rm -rf /tmp \
    && mkdir /tmp \
    && apk del .gem-deps
