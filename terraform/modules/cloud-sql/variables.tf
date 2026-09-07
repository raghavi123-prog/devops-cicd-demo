variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region for the database"
}

variable "instance_name" {
  type        = string
  description = "Name of the Cloud SQL instance"
}

variable "database_version" {
  type        = string
  description = "Database engine and version"
  default     = "POSTGRES_15"
}

variable "tier" {
  type        = string
  description = "Machine tier for the database"
  default     = "db-f1-micro"
}
