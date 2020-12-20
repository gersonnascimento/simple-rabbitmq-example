FROM ruby:2.5

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install
