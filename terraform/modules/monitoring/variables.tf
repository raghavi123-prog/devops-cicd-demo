variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "notification_email" {
  type        = string
  description = "The email address to receive monitoring alerts"
  default     = "admin@example.com"
}

variable "channel_name" {
  type        = string
  description = "Display name for the notification channel"
  default     = "DevOps Alert Channel"
}
