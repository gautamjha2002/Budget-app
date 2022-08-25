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

# Run the command
exec "$@"