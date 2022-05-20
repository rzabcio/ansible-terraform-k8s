resource "google_compute_firewall" "allow-ports" {
    name = "allow-ports"
    network = google_compute_network.main.name 

    allow { 
        protocol = "tcp"
        ports = ["22","80","443"]
    }

    source_ranges = ["0.0.0.0/0"]

}
