resource "random_id" "sa_suffix" {
  byte_length = 3
}

resource "google_service_account" "sa" {
  account_id   = "dev-app-sa-${random_id.sa_suffix.hex}"
  display_name = "Dev Application Service Account"
}
