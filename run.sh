#!/bin/sh
set -e
# Wait for Postgres to become available.
until mysql -h db -u "user" -c '\q' 2>/dev/null; do
  >&2 echo "MySql is unavailable - sleeping"
  sleep 1
done

mix ecto.create
mix ecto.migrate
mix phx.server