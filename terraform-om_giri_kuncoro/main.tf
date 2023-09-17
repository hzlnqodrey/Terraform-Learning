provider "google" {
    project = "belajar-terraform-398813"
    region = "asia-southeast2"
}

resource "google_compute_network" "development_network" {
    name = "development-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet-01" {
    name = "dev-subnet-01"
    ip_cidr_range = "10.100.0.0/16"
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
    secondary_ip_range {
        range_name = "secondary-range-01"
        ip_cidr_range = "192.168.10.0/24"
        
    }
}

data "google_compute_network" "existing_network" {
    name = "default"
}

resource "google_compute_subnetwork" "dev-subnet-02" {
    name = "dev-subnet-02"
    ip_cidr_range = "10.110.0.0/16"
    network = data.google_compute_network.existing_network.id
    region = "asia-southeast2"
}