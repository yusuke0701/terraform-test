# How to apply terraform

1. Install gcloud-sdk from https://cloud.google.com/sdk/docs/install

1. Install terraform from https://learn.hashicorp.com/tutorials/terraform/install-cli

1. Write your google account and your billing account to main.tf

1. Do `gcloud auth login`

1. Do `cd terraform`

1. Do `terraform init`

1. Do `gcloud auth print-access-token`

1. Do `terraform plan -var access_token=your_access_token`

1. Do `terraform apply -target={google_project.project,random_integer.project_id_suffix,google_app_engine_application.default} -var access_token=your_access_token`

1. Do `../scripts/enable_services.sh your_project_id`

1. Do `../scripts/deploy_appengine.sh your_project_id`

1. Do `terraform apply -var access_token=your_access_token`
