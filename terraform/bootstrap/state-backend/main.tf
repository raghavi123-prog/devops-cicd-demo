terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  resolved_bucket_name = var.bucket_name != "" ? var.bucket_name : "${var.project_id}-tfstate-backend"
}

resource "google_storage_bucket" "state_bucket" {
  name          = local.resolved_bucket_name
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
