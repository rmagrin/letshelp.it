#!/usr/bin/env bash

function update_apt_repositories {
  apt-get update -y
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

update_apt_repositories
install_basic_packages
install_requirements
install_ruby
