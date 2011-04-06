load_template "http://github.com/jofi/rails-templates/raw/master/base.rb"
gem 'devise'
gem 'cancan'

rake "gems:install"
rake "devise:setup"

generate :devise_install
generate :devise, "User"
rake "db:migrate"
rake "routes"

git :add => ".", :commit => "-m 'adding devise authentication and cancan authorization'"
