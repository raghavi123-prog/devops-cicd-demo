resource "google_cloud_run_v2_service" "run" {
  project  = var.project_id
  name     = var.service_name
  location = var.region

  template {
    service_account = var.service_account_email
    containers {
      image = var.image
    }
  }
}
