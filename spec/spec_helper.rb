ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'shoulda'
require 'headless'

Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include Capybara::DSL
  config.after { Organization.delete_all }
end

if ENV['GUI'] == 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    exit_status = $!.status if $!.is_a?(SystemExit)
    headless.destroy
    exit exit_status if exit_status
  end
end
