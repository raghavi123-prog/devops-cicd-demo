output "connection_name" {
  value       = google_sql_database_instance.my_db.connection_name
  description = "Cloud SQL Instance Connection Name"
}

output "db_name" {
  value       = google_sql_database_instance.my_db.name
  description = "Cloud SQL Instance Name"
}
