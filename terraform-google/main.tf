terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("<rahasia-pokoknya>.json")
  project = "PROJECT_ID"
  region = "asia-southeast2"
  zone = "asia-southeast2-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}