source 'http://rubygems.org'
ruby '2.1.2'

gem 'rake'
gem 'rails', '~>4.0.9'
gem 'babosa', '~> 0.3.11'
gem 'friendly_id', '~> 5.0.4'
gem 'dynamic_form', '~> 1.1.4'
gem 'RedCloth', '~> 4.2.9'
gem 'truncate_html', '~> 0.9.2'
gem 'unicorn'
gem 'activerecord-deprecated_finders', require: 'active_record/deprecated_finders'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3', '~>1.3.4'
  gem 'rspec-rails', '~> 2.4'
end

group :test do
  gem 'shoulda', '~> 3.5.0', require: false
  gem 'shoulda-kept-assign-to', require: false
  gem 'test-unit'
  gem 'factory_girl', '~> 2.6.4'
  gem 'factory_girl_rails', '~> 1.7.0'
  gem 'selenium-webdriver'
  gem 'headless'
  gem 'capybara'
  gem 'forgery'
end
