output "vm_name" {
  value       = google_compute_instance.my_vm.name
  description = "Compute Instance Name"
}

output "vm_internal_ip" {
  value       = google_compute_instance.my_vm.network_interface[0].network_ip
  description = "Compute Instance Internal IP"
}
