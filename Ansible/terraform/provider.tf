provider "google" {
    credentials = file("terraform-key.json")

    project = var.project 
    region = var.region 
    zone = "us-central1-a"
}

resource "google_compute_network" "vpc_network" {
    name = "new-terraform-network"
}

terraform {
  backend "gcs" {
      bucket = "terraform487238"
      prefix = "terraform1"
      credentials = "terraform-key.json"
  }
}
