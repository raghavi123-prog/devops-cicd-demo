resource "random_id" "vm_suffix" {
  byte_length = 3
}

resource "google_compute_instance" "my_vm" {
  name         = "dev-vm-${random_id.vm_suffix.hex}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
