FROM alpine:latest

ENV BUILD_PACKAGES curl-dev ruby-dev build-base

RUN apk update && apk upgrade && apk add $BUILD_PACKAGES

RUN apk add ruby ruby-io-console ruby-bundler

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app
RUN bundle install

COPY . /usr/app

# Clean APK cache
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ['ruby', './bin/init.rb']
