source 'https://rubygems.org'

# This is important as I have only been install gems for this version.
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use SCSS for stylesheets
gem 'sass-rails', '5.0.4'
gem 'bootstrap-sass', '3.3.6'

# Used in replacement of HTML.
# http://techbus.safaribooksonline.com/book/programming/ruby/9780133487954/
# chapter-12dot-haml/ch12_html?uicode=oracle
# http://haml.info
gem 'haml-rails', '0.9.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.2'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.1'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', '0.12.2', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.0'

# Turbolinks makes following links in your web application faster. Read more:
# https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.4.1'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.1', group: :doc

# Needed for Oracle DB connection
# Ruby driver to connect to DB
gem 'ruby-oci8', '2.2.1'
# Rails active record gem for Oracle DB
gem 'activerecord-oracle_enhanced-adapter', '1.6.0'

group :development, :test do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.3.0'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring', '1.6.3'

  # Test and maintenance related
  gem 'rubocop', '0.34.2'

  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', '8.2.2'
end

# Adding the relevant Gems for testing
group :test do
  # This is the rspec testing framework which provides a expressive
  # way to write tests.
  gem 'rspec-rails', '3.3.3'

  # Capybara provides DSL for browser based testing. Thus providing commands
  # like click , visit, etc. Easy to understand actions as users would navidate.
  gem 'capybara', '2.5.0'

  # Poltergeist replaces webkit as the javascript driver for Capybara
  # See /spec/rails_helper.rb for its reference.
  gem 'poltergeist', '1.8.1'

  # a better
  gem 'pry-rails', '0.3.2'

  # Code coverage by codeclimate
  gem 'codeclimate-test-reporter', '0.4.8', require: nil

  # https://www.pullreview.com/settings/repositories/54091/
  # how_to_enable_coverage
  gem 'pullreview-coverage', '0.0.5', require: false

  # https://coveralls.io/github/alaghu/learn_jquery
  gem 'coveralls', '0.8.3', require: false
end
