resource "google_cloud_run_v2_service" "my_run" {
  name     = "level1-cloudrun-service"
  location = var.region

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}
