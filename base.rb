if yes?("Do you want to use RSpec for testing?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end

gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
plugin 'rails-widgets', :git => 'git://github.com/paolodona/rails-widgets.git'

rake "gems:install"

generate :jofi_layout

git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

if yes?("Do you want to freeze gems?")
  rake "rails:freeze:gems"
end

git :add => ".", :commit => "-m 'initial commit'"
