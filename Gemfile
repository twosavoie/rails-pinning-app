source 'https://rubygems.org'

# allows uploading of images
gem 'paperclip'

# for AWS
gem 'aws-sdk-s3', '~> 1.0.0.rc2'
gem 'aws-sdk', '< 2.0'

#create hyperlinks: rails_autolink
#create pretty urls: friendly_id or urls_for_humans

# for password encryption
gem 'bcrypt', '~> 3.1.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.21.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the web server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# To meet Twelve-factor standards. Log to stdout instead of a log file. Serve static assets.
gem 'rails_12factor'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Helps test validations
  gem 'shoulda-matchers', '4.0.0.rc1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'database_cleaner'

  gem 'rspec', '~> 3.8'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
end

ruby '2.4.4'
