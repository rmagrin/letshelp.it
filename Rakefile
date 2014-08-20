#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

LetshelpIt::Application.load_tasks

task 'test:all' => [ :test, :spec ]

namespace :db do
  desc "Recreate slugs"
  task :recreate_slugs => :environment do
    Organization.find_each(&:save)
  end
end
