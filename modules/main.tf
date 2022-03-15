terraform {
  required_version = ">=0.12"
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.gcs_location
  force_destroy = var.force_destroy
  storage_class = var.storage_class
  #labels        = var.labels

  versioning {

    enabled = var.enable_versioning
  }

}
resource "google_compute_network" "vpc_network" {
  name    = "new-terraform-network"
  project = var.project_id
}

resource "google_compute_instance" "test" {
  name         = "terraform-module"
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "echo Testing-Terraform-Module > / test.txt"
}