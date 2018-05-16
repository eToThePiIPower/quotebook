source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'bootstrap', '~> 4.1.1'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4.3'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.1'
  gem 'dotenv-rails', '~> 2.4.0'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'poltergeist', '~> 1.18'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter', '~> 0.3'
  gem 'rubocop', '~> 0.55'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'guard', '~> 2.14.2'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', '~> 1.3.0'
  gem 'guard-spring', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
