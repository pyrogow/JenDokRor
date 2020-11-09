FROM ruby:2.5.1-alpine
RUN gem install bundler -v 2.0.2
WORKDIR /helloworld/
COPY ./helloworld/ ./helloworld/
CMD ["bash", "rails server"]
