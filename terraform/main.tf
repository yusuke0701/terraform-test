variable "access_token" {}

locals {
  project_name   = "sandbox"
  project_id     = "sandbox-${random_integer.project_id_suffix.result}"
  primary_region = "asia-northeast1"

  account = {
    owner = "your_account" # NOTE: Replace your account
  }
}

# google

provider "google" {
  project      = local.project_id
  region       = local.primary_region
  access_token = var.access_token
}

resource "google_project" "project" {
  name            = local.project_name
  project_id      = local.project_id
  billing_account = "your_billing_account" # NOTE: Replace your billing account
}

## appengine

resource "google_app_engine_application" "default" {
  project     = local.project_id
  location_id = local.primary_region
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/iap.httpsResourceAccessor"
    members = [
      "user:${local.account.owner}",
    ]
  }
}

resource "google_iap_app_engine_service_iam_policy" "default" {
  project     = local.project_id
  app_id      = google_app_engine_application.default.app_id
  service     = "default"
  policy_data = data.google_iam_policy.admin.policy_data
}

# random

resource "random_integer" "project_id_suffix" {
  min = 1000
  max = 99999
}
