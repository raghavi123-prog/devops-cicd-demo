resource "random_id" "run_suffix" {
  byte_length = 3
}

resource "google_cloud_run_v2_service" "run" {
  name     = "dev-cloudrun-service-${random_id.run_suffix.hex}"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      ports {
        container_port = 8080
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  location = google_cloud_run_v2_service.run.location
  service  = google_cloud_run_v2_service.run.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
