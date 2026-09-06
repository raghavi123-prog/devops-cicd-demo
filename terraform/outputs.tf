output "bucket_url" {
  value       = google_storage_bucket.demo_bucket.url
  description = "The GCS Bucket URL"
}

output "vm_name" {
  value       = google_compute_instance.my_vm.name
  description = "Compute Instance Name"
}

output "cloud_run_uri" {
  value       = google_cloud_run_v2_service.my_run.uri
  description = "Cloud Run Service URI"
}

output "database_connection_name" {
  value       = google_sql_database_instance.my_db.connection_name
  description = "Cloud SQL Instance Connection Name"
}
