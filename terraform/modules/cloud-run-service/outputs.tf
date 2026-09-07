output "uri" {
  value       = google_cloud_run_v2_service.run.uri
  description = "The main URL endpoint of the Cloud Run service"
}

output "service_name" {
  value       = google_cloud_run_v2_service.run.name
  description = "The deployed service name"
}
