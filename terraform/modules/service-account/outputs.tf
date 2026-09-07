output "email" {
  value       = google_service_account.sa.email
  description = "The email address of the service account"
}

output "name" {
  value       = google_service_account.sa.name
  description = "The fully-qualified name of the service account"
}
