resource "google_compute_instance" "vm-from-tf" {
 
  name         = "vm-from-tf"
  machine_type = "n1-standard-1"
  zone        = "us-central1-a"
  allow_stopping_for_update = true

  network_interface {
   network = "default"
   subnetwork = "default"
 
  }
  boot_disk {
    initialize_params {
     image = "debian-9-stretch-v20210916"
      size = 20

    }
     auto_delete = "false"
  }
 
  labels = {
    "whos" = "anup"
  }
scheduling {
preemptible = false
automatic_restart = true
}

service_account {
  email = "terraform-gcp@terraform-gcp-383119.iam.gserviceaccount.com"
  scopes = [ "cloud-platform" ]
}
}
resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 2
  zone = "us-central1-a"
  type = "pd-ssd"
}
resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}
