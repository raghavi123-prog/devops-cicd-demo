output "uat_service_account_email" {
  value       = module.service_account.email
  description = "UAT Service Account Email"
}

output "uat_artifact_registry_id" {
  value       = module.artifact_registry.repository_id
  description = "UAT Artifact Registry Repository ID"
}

output "uat_cloud_run_uri" {
  value       = module.cloud_run.uri
  description = "UAT Cloud Run Service URI"
}

output "uat_monitoring_channel_id" {
  value       = module.monitoring.channel_id
  description = "UAT Monitoring Channel ID"
}
