#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# cd ./helloworld && bundle exec rails s
bundle exec rails s