locals {
  image_url = "${var.region}-docker.pkg.dev/${var.project_id}/demo-repo/flask-app:${var.image_tag}"
}

# -------------------------------------------------------------
# 1. DEV Cloud Run Service
# -------------------------------------------------------------
resource "google_cloud_run_v2_service" "flask_dev" {
  name     = "flask-app-dev"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = "sa-cloudrun-runtime@${var.project_id}.iam.gserviceaccount.com"

    scaling {
      min_instance_count = 0
      max_instance_count = 3
    }

    containers {
      image = local.image_url

      ports {
        container_port = 8080
      }

      # Startup probe waits for app initialization
      startup_probe {
        http_get {
          path = "/health"
          port = 8080
        }
        initial_delay_seconds = 5
        period_seconds        = 10
        failure_threshold     = 3
      }

      # Liveness probe monitors running container health
      liveness_probe {
        http_get {
          path = "/health"
          port = 8080
        }
        period_seconds    = 15
        failure_threshold = 3
      }
    }
  }
}

# Allow unauthenticated public access for DEV
resource "google_cloud_run_service_iam_member" "dev_public_access" {
  location = google_cloud_run_v2_service.flask_dev.location
  service  = google_cloud_run_v2_service.flask_dev.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# -------------------------------------------------------------
# 2. UAT Cloud Run Service
# -------------------------------------------------------------
resource "google_cloud_run_v2_service" "flask_uat" {
  name     = "flask-app-uat"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = "sa-cloudrun-runtime@${var.project_id}.iam.gserviceaccount.com"

    scaling {
      min_instance_count = 0
      max_instance_count = 5
    }

    containers {
      image = local.image_url

      ports {
        container_port = 8080
      }

      startup_probe {
        http_get {
          path = "/health"
          port = 8080
        }
        initial_delay_seconds = 5
        period_seconds        = 10
        failure_threshold     = 3
      }

      liveness_probe {
        http_get {
          path = "/health"
          port = 8080
        }
        period_seconds    = 15
        failure_threshold = 3
      }
    }
  }
}

# Allow unauthenticated access for UAT testers
resource "google_cloud_run_service_iam_member" "uat_public_access" {
  location = google_cloud_run_v2_service.flask_uat.location
  service  = google_cloud_run_v2_service.flask_uat.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# -------------------------------------------------------------
# Outputs
# -------------------------------------------------------------
output "dev_service_url" {
  value = google_cloud_run_v2_service.flask_dev.uri
}

output "uat_service_url" {
  value = google_cloud_run_v2_service.flask_uat.uri
}
