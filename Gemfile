source :rubygems

# Server requirements
gem 'thin'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'mongo'
gem 'mongoid'
gem 'bson_ext', :require => 'mongo'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'RedCloth'

# Asset requirements
gem 'haml'
gem 'sass'
# gem 'padrino-sprockets', :require => 'padrino/sprockets'
gem 'padrino-sprockets', :require => [ 'sprockets', 'padrino/sprockets'], :git => 'git://github.com/nightsailer/padrino-sprockets.git'
gem 'coffee-script'

# Padrino Stable Gem
gem 'padrino', '0.10.7'

group :development do
  gem 'pry'
  gem 'awesome_print'
end
