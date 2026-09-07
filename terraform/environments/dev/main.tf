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

# 1. Service Account Module
module "service_account" {
  source       = "../../modules/service-account"
  project_id   = var.project_id
  account_id   = "${var.environment}-app-sa"
  display_name = "Dev Application Service Account"
}

# 2. Artifact Registry Module
module "artifact_registry" {
  source        = "../../modules/artifact-registry"
  project_id    = var.project_id
  region        = var.region
  repository_id = "${var.environment}-docker-repo"
}

# 3. Cloud Run Module
module "cloud_run" {
  source                = "../../modules/cloud-run-service"
  project_id            = var.project_id
  service_name          = "${var.environment}-cloudrun-service"
  region                = var.region
  image                 = "us-docker.pkg.dev/cloudrun/container/hello"
  service_account_email = module.service_account.email
}

# 4. Monitoring Module
module "monitoring" {
  source             = "../../modules/monitoring"
  project_id         = var.project_id
  channel_name       = "Dev Environment Alert Channel"
  notification_email = "admin@example.com"
}

# 5. Compute VM Module
module "compute_vm" {
  source        = "../../modules/compute-vm"
  project_id    = var.project_id
  region        = var.region
  instance_name = "${var.environment}-vm-instance"
}

# 6. Cloud SQL Module
module "cloud_sql" {
  source        = "../../modules/cloud-sql"
  project_id    = var.project_id
  region        = var.region
  instance_name = "${var.environment}-db-${var.project_id}"
}
