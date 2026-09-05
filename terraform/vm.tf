resource "google_compute_instance" "my_vm" {
  name         = "level1-vm-instance"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
