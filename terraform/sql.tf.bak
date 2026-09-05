resource "google_sql_database_instance" "my_db" {
  name                = "level1-postgres-db"
  database_version    = "POSTGRES_15"
  region              = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}
