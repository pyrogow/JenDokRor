FROM ruby:alpine3.12
RUN RUN apt-get update && apt-get install -y sudo ruby rails vim nano bundler
WORKDIR /helloworld/
COPY ./helloworld/ ./helloworld/
ENTRYPOINT ["./helloworld/start.sh"]
# CMD ["bash", "rails server"]
