load_template "https://github.com/jofi/rails-templates/raw/master/base.rb"
gem 'devise'
gem 'cancan'

rake "gems:install"

generate :devise_install
generate :devise_views
generate :devise, "User"
rake "db:migrate"
rake "routes"

git :add => ".", :commit => "-m 'adding devise authentication and cancan authorization'"
