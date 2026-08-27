# -------------------------------------------------------------
# DEV Environment: Cloud Run Service
# -------------------------------------------------------------
resource "google_cloud_run_v2_service" "flask_dev" {
  name     = "flask-app-dev"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = "sa-cloudrun-runtime@${var.project_id}.iam.gserviceaccount.com"

    containers {
      image = var.image_name
      ports {
        container_port = 8080
      }

      startup_probe {
        initial_delay_seconds = 5
        timeout_seconds       = 1
        period_seconds        = 10
        failure_threshold     = 3
        http_get {
          path = "/health"
          port = 8080
        }
      }

      liveness_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 1
        period_seconds        = 15
        failure_threshold     = 3
        http_get {
          path = "/health"
          port = 8080
        }
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 3
    }
  }
}

resource "google_cloud_run_service_iam_member" "dev_public_access" {
  location = var.region
  service  = google_cloud_run_v2_service.flask_dev.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# -------------------------------------------------------------
# UAT Environment: Cloud Run Service
# -------------------------------------------------------------
resource "google_cloud_run_v2_service" "flask_uat" {
  name     = "flask-app-uat"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = "sa-cloudrun-runtime@${var.project_id}.iam.gserviceaccount.com"

    containers {
      image = var.image_name
      ports {
        container_port = 8080
      }

      startup_probe {
        initial_delay_seconds = 5
        timeout_seconds       = 1
        period_seconds        = 10
        failure_threshold     = 3
        http_get {
          path = "/health"
          port = 8080
        }
      }

      liveness_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 1
        period_seconds        = 15
        failure_threshold     = 3
        http_get {
          path = "/health"
          port = 8080
        }
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 5
    }
  }
}

resource "google_cloud_run_service_iam_member" "uat_public_access" {
  location = var.region
  service  = google_cloud_run_v2_service.flask_uat.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# -------------------------------------------------------------
# Outputs
# -------------------------------------------------------------
output "dev_service_url" {
  value       = google_cloud_run_v2_service.flask_dev.uri
  description = "Public URL for the Dev Cloud Run Service"
}

output "uat_service_url" {
  value       = google_cloud_run_v2_service.flask_uat.uri
  description = "Public URL for the UAT Cloud Run Service"
}
