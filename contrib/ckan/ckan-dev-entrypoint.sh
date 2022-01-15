#!/bin/sh
set -e

pip install -e /src/ckanext-s3filestore
pip install -e /src/ckanext-genderopendata

exec /ckan-entrypoint.sh "$@"
