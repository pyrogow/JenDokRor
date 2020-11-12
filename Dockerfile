FROM ruby:alpine3.12
# RUN apt-get update && apt-get install -y sudo ruby rails vim nano
RUN sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
RUN sudo apt-get install git-core
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN gem install bundler
#gem install bundler:1.17.2
# RUN bundle update --bundler
COPY ./helloworld/ ./helloworld/
WORKDIR ./helloworld/
ENTRYPOINT ["./start.sh"]
# CMD ["bash", "rails server"]

# FROM ruby:alpine3.12
# # RUN apt-get update && apt-get install -y sudo ruby rails vim nano
# RUN gem install bundler
# #gem install bundler:1.17.2
# # RUN bundle update --bundler
# COPY ./helloworld/ ./helloworld/
# WORKDIR ./helloworld/
# ENTRYPOINT ["./start.sh"]
# # CMD ["bash", "rails server"]