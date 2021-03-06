# Create a new instance
resource "google_compute_instance" "monitoring1" {
   name = "monitoring1"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "monitoring1"
  }
   metadata_startup_script = "echo hi > /test.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "${google_compute_network.monitoring.name}"

}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}



# Create a new instance
resource "google_compute_instance" "monitoring2" {
   name = "monitoring2"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "monitoring2"
  }
   metadata_startup_script = "echo hi > /test1.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "${google_compute_network.platform.name}"
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}




