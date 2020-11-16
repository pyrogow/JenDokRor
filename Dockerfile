# FROM ruby:alpine3.12
# # RUN apt-get update && apt-get install -y sudo ruby rails vim nano
# RUN apk update 
# # RUN bundle install
# # RUN apk add rbenv
# # RUN apk add git-core
# # RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# # RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# # RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# # RUN gem install bundler
# #gem install bundler:1.17.2
# # RUN bundle update --bundler
# COPY ./helloworld/ ./helloworld/
# WORKDIR /helloworld/
# # RUN bundle install
# ENTRYPOINT ["./start.sh"]
# # CMD ["bash", "rails server"]

# FROM ruby:alpine3.12
# # RUN apt-get update && apt-get install -y sudo ruby rails vim nano
# RUN apk add --update --no-cache autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
# RUN apk add git-core
# RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# RUN gem install bundler
# #gem install bundler:1.17.2
# # RUN bundle update --bundler
# COPY ./helloworld/ ./helloworld/
# WORKDIR ./helloworld/
# ENTRYPOINT ["./start.sh"]
# # CMD ["bash", "rails server"]

# FROM ruby:alpine3.12
# # RUN apt-get update && apt-get install -y sudo ruby rails vim nano
# RUN gem install bundler
# #gem install bundler:1.17.2
# # RUN bundle update --bundler
# COPY ./helloworld/ ./helloworld/
# WORKDIR ./helloworld/
# ENTRYPOINT ["./start.sh"]
# # CMD ["bash", "rails server"]



# FROM ruby:alpine3.12
# RUN apk update
# RUN apk add sudo vim nano git

# # rbenv
# ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH
# ENV RBENV_ROOT /usr/local/rbenv
# ENV RUBY_VERSION 2.6.3
# ENV CONFIGURE_OPTS --disable-install-doc

# RUN git clone --depth 1 git://github.com/sstephenson/rbenv.git ${RBENV_ROOT} \
# &&  git clone --depth 1 https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build \
# &&  git clone --depth 1 git://github.com/jf/rbenv-gemset.git ${RBENV_ROOT}/plugins/rbenv-gemset \
# && ${RBENV_ROOT}/plugins/ruby-build/install.sh

# RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh 

# RUN rbenv install $RUBY_VERSION \
# &&  rbenv global $RUBY_VERSION

# RUN gem install bundler
# RUN gem install rails -v 5.2.0
# RUN gem install sqlite3 -v 1.4.2
# # RUN curl -sSL https://get.docker.com/ | sh
# # # Add jenkins user to docker group
# # RUN usermod -a -G docker jenkins

# COPY ./helloworld/ ./helloworld/
# WORKDIR /helloworld/
# # RUN bundle install
# RUN bundle install

# ENTRYPOINT ["./start.sh"]

FROM ruby:alpine3.12
RUN apk add --update \
    bash \
    git \
    wget \
    curl \
    vim \
    build-base \
    readline-dev \
    openssl-dev \
    zlib-dev \
    yarn \
&& rm -rf /var/cache/apk/*

# rbenv
ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv
ENV RUBY_VERSION 2.7.1
ENV RAILS_VERSION 6.0.3.4
ENV CONFIGURE_OPTS --disable-install-doc

RUN apk add --update \
    linux-headers \
    imagemagick-dev \    
    libffi-dev \    
    libffi-dev \
&& rm -rf /var/cache/apk/*

RUN git clone --depth 1 git://github.com/sstephenson/rbenv.git ${RBENV_ROOT} \
&&  git clone --depth 1 https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build \
&&  git clone --depth 1 git://github.com/jf/rbenv-gemset.git ${RBENV_ROOT}/plugins/rbenv-gemset \
&& ${RBENV_ROOT}/plugins/ruby-build/install.sh

RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh 

RUN rbenv install $RUBY_VERSION \
&&  rbenv global $RUBY_VERSION

RUN gem install tzinfo-data
RUN gem install bundler
RUN gem install rails -v $RAILS_VERSION

# Add files
COPY ./helloworld/ ./helloworld/
WORKDIR ./helloworld/
# RUN bundle install
RUN bundle install

# CMD
ENTRYPOINT ["./start.sh"]