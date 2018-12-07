#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
# Add latest nodejs sources
curl -sL https://deb.nodesource.com/setup_7.x | bash -
apt-get update
apt-get install -y nodejs git libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev cmake pkg-config libicu-dev g++ redis-server golang-go

mkdir /opt/ruby
chown vagrant:vagrant /opt/ruby

# TODO(cleanup): the logic this unpriviliged-setup script probably belongs in build.sh.
su -c "bash /opt/app/.sandstorm/unprivileged-setup.sh" vagrant

exit 0
