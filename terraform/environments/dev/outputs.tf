output "dev_service_account_email" {
  value       = module.service_account.email
  description = "Dev Service Account Email"
}

output "dev_artifact_registry_id" {
  value       = module.artifact_registry.repository_id
  description = "Dev Artifact Registry Repository ID"
}

output "dev_cloud_run_uri" {
  value       = module.cloud_run.uri
  description = "Dev Cloud Run Service URI"
}

output "dev_monitoring_channel_id" {
  value       = module.monitoring.channel_id
  description = "Dev Monitoring Channel ID"
}
