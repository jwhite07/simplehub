source 'https://rubygems.org'
ruby '2.3.1'
#RAILS DEFAULT GEMS
gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'liquid', '~> 3.0', '>= 3.0.6'
# # gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
#### END DEFAULT GEMS

gem 'devise'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails'
  gem "factory_girl_rails"
  gem 'guard-rspec', require: false
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'teaspoon-jasmine'
  gem 'ffaker'
  
end
group :test do
  gem 'capybara'
  
  gem 'launchy'
  gem "shoulda-matchers"
  gem 'factory_girl_rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'bower-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
