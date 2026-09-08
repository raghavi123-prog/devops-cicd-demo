resource "random_id" "db_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "my_db" {
  name             = "dev-db-${var.project_id}-${random_id.db_suffix.hex}"
  database_version = "POSTGRES_15"
  region           = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
    }
  }
}
