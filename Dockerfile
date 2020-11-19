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

RUN apk add --no-cache sqlite-libs
RUN apk add openssh-client build-base mariadb-dev sqlite-dev

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
RUN gem install sqlite3

# Add files
COPY ./helloworld/ ./helloworld/
WORKDIR ./helloworld/
# RUN bundle install
RUN bundle install
RUN yarn install --check-files

# CMD
ENTRYPOINT ["./start.sh"]