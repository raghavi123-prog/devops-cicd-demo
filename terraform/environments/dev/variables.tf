variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region for dev resources"
  default     = "us-central1"
}

variable "environment" {
  type        = string
  description = "Environment name identifier"
  default     = "dev"
}
