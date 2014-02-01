source 'https://rubygems.org'

ruby '2.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Foundation for the front-end
gem 'foundation-rails', '~> 5.0.2.0'
gem 'foundation-icons-sass-rails', '~> 3.0.0'

# omniauth strategies
gem 'omniauth-github', '~> 1.1'

# use paperclip for user photos
gem 'paperclip', '~> 3.5.2'

# Simple form builder
gem "simple_form", "~> 3.0"

gem 'newrelic_rpm'

# ActiveAdmin for managing proposals
gem 'activeadmin', github: 'gregbell/active_admin'

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor'
  gem 'aws-sdk', '~> 1.32'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'debugger'
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '~> 2.2'
end
