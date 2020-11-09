FROM ruby:alpine3.12
# RUN apt-get update && apt-get install -y sudo ruby rails vim nano
RUN gem install bundler
#gem install bundler:1.17.2
# RUN bundle update --bundler
#WORKDIR /helloworld/
COPY ./helloworld/ ./helloworld/
ENTRYPOINT ["./helloworld/start.sh"]
# CMD ["bash", "rails server"]
