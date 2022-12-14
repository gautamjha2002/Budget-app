#!/bin/bash
set -e
# for development check if the gems are installed or not, if not
# then install them
if ! [ bundle check ];
    then
        bundle install
fi

# Remove a potentially pre-existing server.pid for rails.
rm -f /app/tmp/pids/server.pid

# creating DB
rake db:create

# migrating db
rails db:migrate RAILS_ENV=development

# Run the command
bundle exec rails s -p 3000 -b '0.0.0.0'
