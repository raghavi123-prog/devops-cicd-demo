variable "project_id" {
  description = "The Google Cloud Project ID"
  type        = string
  default     = "project-c6caeb96-abbd-4e9c-bfa"
}

variable "region" {
  description = "The GCP region for deployments"
  type        = string
  default     = "us-central1"
}

variable "image_name" {
  description = "Artifact Registry Docker image path"
  type        = string
  default     = "us-central1-docker.pkg.dev/project-c6caeb96-abbd-4e9c-bfa/demo-repo/flask-app:latest"
}
