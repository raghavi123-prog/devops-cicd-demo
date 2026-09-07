output "repository_id" {
  value       = google_artifact_registry_repository.repo.id
  description = "The repository ID"
}

output "repository_name" {
  value       = google_artifact_registry_repository.repo.name
  description = "The fully qualified resource name of the repository"
}
