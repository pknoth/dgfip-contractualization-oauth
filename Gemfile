source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'devise'
gem 'devise-i18n'
gem 'doorkeeper'
gem 'doorkeeper-i18n'
gem 'jquery-rails'
gem 'omniauth-oauth2'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.1.4'
gem 'rails-i18n'
gem 'react-rails'
gem 'slim-rails'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
