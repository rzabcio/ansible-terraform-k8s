provider "google" {
    credentials = file("terraform-key.json")

    project = var.project 
    region = var.region 
    zone = "us-central1-a"
}

terraform {
  backend "gcs" {
      bucket = "terraform08327"
      prefix = "terraform1"
      credentials = "terraform-key.json"
  }
}

