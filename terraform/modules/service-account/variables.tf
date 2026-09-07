variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "account_id" {
  type        = string
  description = "The unique service account ID"
}

variable "display_name" {
  type        = string
  description = "Display name for the service account"
  default     = "Managed Service Account"
}
