#static IP for ingress to create SSL cert

resource "google_compute_global_address" "default" {
  project      = var.project 
  name         = "static-ingress"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
}

output "addresses" {
  description = "IP address"
  value       = google_compute_global_address.default.address
}

resource "local_file" "private_key" {
    content  = google_compute_global_address.default.address
    filename = "staticIpOutput.txt"
}
