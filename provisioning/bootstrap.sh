#!/usr/bin/env bash

function update_apt_repositories {
  echo "Adding new apt repositories..."
  # add heroku repository to apt
  echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
  # install heroku's release key for package verification
  wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
  # Update apt
  apt-get update -y
  echo "Done adding new apt repositories."
}

function install_basic_packages {
  apt-get install -y vim curl git
}

function install_requirements {
  # git is need for deployment with capistrano
  # rails requirements build-essential, nodejs (for execjs), libsqlite3-dev, postgresql-dev
  apt-get install -y nodejs build-essential libsqlite3-dev postgresql-server-dev-all
}

function install_ruby {
  echo "Installing ruby..."
  apt-get remove -y ruby1.9 ruby1.9.1
  apt-get install -y ruby1.8 ruby1.8-dev rubygems
  gem install bundler
  echo "Done installing ruby."
}

function install_heroku_toolbelt {
  apt-get install -y postgresql-client heroku-toolbelt
}

update_apt_repositories
install_basic_packages
install_requirements
install_ruby
install_heroku_toolbelt
