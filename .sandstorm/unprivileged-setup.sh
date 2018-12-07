#!/bin/bash

set -euo pipefail


cd /opt/ruby

git clone https://github.com/rbenv/rbenv.git /opt/ruby/rbenv
git clone https://github.com/rbenv/ruby-build.git /opt/ruby/rbenv/plugins/ruby-build

export PATH=/opt/ruby/rbenv/bin:$PATH
export RBENV_ROOT=/opt/ruby/rbenv
# export RBENV_VERSION=2.5.1
eval "$(rbenv init -)"

# to list all available versions: rbenv install -l
rbenv install 2.5.1
rbenv shell 2.5.1

gem install bundler

cd /opt/app
make
