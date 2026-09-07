variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The region for the Artifact Registry repository"
}

variable "repository_id" {
  type        = string
  description = "The repository ID / name"
}
