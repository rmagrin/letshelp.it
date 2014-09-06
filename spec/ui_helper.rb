require 'rails_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'capybara/rails'
require 'headless'

Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include Capybara::DSL
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
