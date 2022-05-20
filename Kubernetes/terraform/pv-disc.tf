#PVdisc for k8s pv&pvc 

resource "google_compute_region_disk" "regiondisk" {
  name = "gke-pv"
  type = "pd-ssd"
  region = "us-central1"
  size = 50

  replica_zones = ["us-central1-a", "us-central1-f"]

}
