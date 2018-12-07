GitLab Sandstorm package
===========================

This is a fork of https://gitlab.com/gitlab-org/gitlab-development-kit.git,
adapted for development of a GitLab Sandstorm app.

# How to

The package is done with [vagrant-spk](https://github.com/sandstorm-io/vagrant-spk), a tool designed to help app developers package apps for [Sandstorm](https://sandstorm.io).

You can follow the below mentioned steps to make your own package or to contribute.

## Prerequisites

You will need to install:
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Git](https://git-scm.com/downloads) or any Git-client you like to use

## Step by Step

```
git clone https://github.com/sandstorm-io/vagrant-spk
git clone https://github.com/wpsandstorm/gitlab-sandstorm
cd vagrant-spk
export PATH=$(pwd)/vagrant-spk:$PATH
cd ..
cd gitlab-sandstorm
vagrant-spk vm up
vagrant-spk dev
```

visit [http://local.sandstorm.io:6080/](http://local.sandstorm.io:6080/) in a web browser

Note: when you want to fork this repo and create actual app packages for the app store you would need either the original app key or create a new one and make your own version of the app.
