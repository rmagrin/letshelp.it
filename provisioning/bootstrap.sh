#!/usr/bin/env bash

function update_apt_repositories {
  echo "Adding new apt repositories..."
  apt-get update -y
  apt-get install -y python-software-properties
  # Ruby repository
  add-apt-repository -y ppa:brightbox/ruby-ng
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
  apt-get install -y ruby2.1 ruby2.1-dev
  gem install bundler
  echo "Done installing ruby."
}

function install_heroku_toolbelt {
  apt-get install -y postgresql-client heroku-toolbelt
}

function install_firefox {
  apt-get install -y xvfb firefox
}

function setup_to_run_ui_tests {
  if [ "$GUI" == "headless" ]; then
    echo "GUI is already set to headless"
  else
    echo "export GUI=\"headless\"" >> /home/vagrant/.profile
  fi
}

update_apt_repositories
install_basic_packages
install_requirements
install_ruby
install_heroku_toolbelt
install_firefox
setup_to_run_ui_tests
