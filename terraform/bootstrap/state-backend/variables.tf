variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region for the state storage bucket"
  default     = "us-central1"
}

variable "bucket_name" {
  type        = string
  description = "The globally unique name for the Terraform state bucket"
  default     = ""
}
