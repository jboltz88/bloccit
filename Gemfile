source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# #1
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# #2
group :development do
  gem 'sqlite3'
  gem 'better_errors' # Enhanced Rails error page with built in rails console
  gem 'binding_of_caller' #Required by better_errors
  gem 'quiet_assets' # Less noisy but easier to debug server output
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails' # allows call to binding.pry to "pry open" running code
  gem 'pry-doc' # enables viewing of Ruby core source+docs in pry
  gem 'pry-inline' # automatically shows variable values inline in rails console
  gem 'rb-readline' # rb-readline makes pry history behave on all platforms
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.0'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'bootstrap-sass'

gem 'bcrypt'

gem 'figaro', '1.0'
