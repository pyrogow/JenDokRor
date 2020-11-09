FROM ruby:2.5.1-alpine
RUN gem install bundler -v 2.0.2
COPY ./helloworld/ ./helloworld/
CMD ruby -e "puts 1 + 2"