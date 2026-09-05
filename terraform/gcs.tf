resource "google_storage_bucket" "my_bucket" {
  name                     = "${var.project_id}-demo-bucket"
  location                 = var.region
  force_destroy            = true
  uniform_bucket_level_access = true
}
