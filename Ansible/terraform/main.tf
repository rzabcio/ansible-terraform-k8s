

resource "google_compute_instance" "vm_instance" {
    name = "terraform-host"
    machine_type = "f1-micro"
    tags = ["web"]
    zone = "us-central1-a"
    boot_disk { 
        initialize_params {
            image = "debian-10-buster-v20220406"
        }
    }

    network_interface { 
        network = google_compute_network.vpc_network.name 
        access_config {

        }
    }
}

resource "google_compute_firewall" "default" {
    name = "testfirewall"
    network = google_compute_network.vpc_network.name 

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports = ["22", "80","8080","1000-2000"]
    }

    source_tags = ["web"]
    source_ranges = ["0.0.0.0/0"]
}
