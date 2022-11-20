#!/bin/sh
set -e

pip install -e /src/ckanext-s3filestore
pip install -e /src/ckanext-genderopendata

# Set users
chown -R www-data:www-data /src

exec /ckan-entrypoint.sh "$@"
