source 'http://rubygems.org'
ruby '1.8.7'

gem 'rake'
gem 'rails', '~>3.0.20'
gem 'friendly_id', '3.2.1.1'
gem 'babosa', '0.3.4'
gem 'RedCloth', '4.2.3'
gem 'truncate_html', '0.5.1'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3', '~>1.3.4'
end

group :test do
  gem 'shoulda', '~> 3.0.1'
  gem 'test-unit'
  gem 'rcov'
  gem 'ruby-prof', '~> 0.11.3'
end
