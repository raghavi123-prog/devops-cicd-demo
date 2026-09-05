resource "google_cloud_run_v2_service" "my_run" {
  name     = "level1-cloudrun-service"
  location = var.region

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "noauth" {
  name     = google_cloud_run_v2_service.my_run.name
  location = google_cloud_run_v2_service.my_run.location
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [google_cloud_run_v2_service.my_run]
}
