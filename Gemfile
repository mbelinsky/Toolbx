source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'chosen-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
# gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'

gem 'ejs'

# use Thin as webserver to get around this WEBrick issue:
# http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h
gem 'thin'

# test stuff
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'awesome_print'
end
group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov', require: false
end

gem 'kaminari' # Kaminari for pagination
gem 'rails_config' # rails_config for global Settings object
gem 'truncate_html' # truncate_html for article summaries
gem 'newrelic_rpm' # New Relic
gem 'json', '~> 1.7.7' # Explicit JSON for security stuff (CVE-2013-0269)
gem 'paperclip' # Paperclip for imagey stuff
gem 'aws-sdk' # S3, etc
gem 'simple_enum' # simple_enum
gem 'mysql2' # mysql adapter
gem 'exception_notification' # notify on exceptions
gem 'validates_email_format_of' # email validation
gem 'omniauth-facebook' # facebook login
gem 'tire' # elasticsearch
gem 'redcarpet' # markdown!
gem 'mixpanel-ruby' # mixpanel gem, just for the admin tracking stuff
gem 'gibbon'
