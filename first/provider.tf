terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.60.2"
    }
  }
}

provider "google" {
  # Configuration options
    project     = "terraform-gcp-383119"
    region      = "us-central1"
    zone        = "us-central1-a"
    credentials = "key.json"
}

