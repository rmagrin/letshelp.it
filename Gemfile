source 'http://rubygems.org'
ruby '2.1.2'

gem 'rake'
gem 'rails', '4.1.10'
gem 'babosa', '~> 1.0.2'
gem 'friendly_id', '~> 5.1.0'
gem 'dynamic_form', '~> 1.1.4'
gem 'RedCloth', '~> 4.2.9'
gem 'truncate_html', '~> 0.9.2'
gem 'unicorn'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3', '~>1.3.4'
  gem 'rspec-rails', '~> 3.2.1'
end

group :test do
  gem 'shoulda', '~> 3.5.0', require: false
  gem 'shoulda-kept-assign-to', require: false
  gem 'test-unit'
  gem 'factory_girl', '~> 4.5.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'selenium-webdriver', '~> 2.45.0'
  gem 'headless'
  gem 'capybara'
  gem 'forgery'
end
