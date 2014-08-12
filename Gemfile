source 'http://www.rubygems.org'

ruby '2.1.5'

gem 'rails', '4.1.4'
gem 'pg' # Use postgresql as the database for Active Record
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
gem 'therubyracer',  platforms: :ruby # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'rails_12factor', group: :production # makes deploy to Heroku easier
gem 'unicorn' # recommended by Heroku
gem 'haml-rails'
gem 'rabl-rails'

gem 'decent_exposure'

gem 'angularjs-rails'
gem 'angularjs-rails-resource', '~> 1.1.1'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'factory_girl_rails'
  gem 'api_matchers'
  gem 'codeclimate-test-reporter', require: nil
end

group :development do
  gem 'thin'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'awesome_print'
end

