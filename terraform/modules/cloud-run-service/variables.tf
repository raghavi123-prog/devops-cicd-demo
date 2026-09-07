variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region"
}

variable "service_name" {
  type        = string
  description = "The name of the Cloud Run service"
}

variable "image" {
  type        = string
  description = "The container image URL to deploy"
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "service_account_email" {
  type        = string
  description = "The email of the service account to attach"
  default     = null
}
