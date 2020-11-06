FROM ruby:2.5.5-alpine
RUN apt update
RUN bundle install
COPY ./helloworld/ ./helloworld/
CMD ruby -e "puts 1 + 2"