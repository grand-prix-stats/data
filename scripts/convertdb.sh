#!/usr/bin/env sh
set -e

echo "Converting SQL..."
./scripts/mysql2sqlite.sh db/f1stats.sql > db/f1stats.sqlite.sql

echo "Importing data..."
rm db/f1stats.sqlite
sqlite3 db/f1stats.sqlite < db/f1stats.sqlite.sql

echo "Done."
