resource "random_id" "repo_suffix" {
  byte_length = 3
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "dev-repo-${random_id.repo_suffix.hex}"
  description   = "Docker repository managed by Terraform"
  format        = "DOCKER"
}
