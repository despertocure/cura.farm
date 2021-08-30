# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bitly'
gem 'cloudinary', '= 1.9.1'
gem 'devise'
gem 'htmlcompressor'
gem 'jbuilder', '~> 2.5'
gem 'money-rails'
gem 'rails', '~> 5.2.4'
gem 'react-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'dalli'
  gem 'passenger'
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'derailed_benchmarks'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'puma'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
