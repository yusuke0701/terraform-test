#!/usr/bin/env bash
set -exo

if [ -z "$1" ]; then
  echo "project id is required."
  exit 1
fi
project_id=$1

cd `dirname $0`

cd ../app/appengine

gcloud app deploy --project "$project_id" --quiet