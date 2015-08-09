source 'http://rubygems.org'
ruby '2.2.2'

gem 'rake', '~> 10.4.2'
gem 'rails', '4.2.3'
gem 'babosa', '~> 1.0.2'
gem 'friendly_id', '~> 5.1.0'
gem 'dynamic_form', '~> 1.1.4'
gem 'RedCloth', '~> 4.2.9'
gem 'truncate_html', '~> 0.9.2'
gem 'unicorn', '~> 4.9.0'

group :production do
  gem 'pg', '~> 0.18.2'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.10'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'web-console', '~> 2.2.1'
end

group :test do
  gem 'shoulda', '~> 3.5.0', require: false
  gem 'shoulda-kept-assign-to', '~> 1.0.1', require: false
  gem 'test-unit', '~> 3.1.3'
  gem 'factory_girl', '~> 4.5.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'selenium-webdriver', '~> 2.47.1'
  gem 'headless', '~> 2.2.0'
  gem 'capybara', '~> 2.4.4'
  gem 'forgery', '~> 0.6.0'
end
