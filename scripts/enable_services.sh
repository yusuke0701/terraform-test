#!/usr/bin/env bash
set -exo

if [ -z "$1" ]; then
  echo "project id is required."
  exit 1
fi
project_id=$1

services=(
  "appengine.googleapis.com"             # GAE Admin API
  "cloudbuild.googleapis.com"           # Cloud Build API
  "cloudresourcemanager.googleapis.com" # Cloud Resource Manager API
  "compute.googleapis.com"              # Compute Engine API
  "iam.googleapis.com"                  # Identity and Access Management (IAM) API
  "iap.googleapis.com"                  # Cloud Identity-Aware Proxy API
)
for service in "${services[@]}"; do
  gcloud services enable --project "$project_id" "$service"
done
