#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# cd ./helloworld && bundle exec rails s
bundle exec rails server --binding 0.0.0.0 --port 3000