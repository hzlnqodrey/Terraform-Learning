provider "google" {
    project = "belajar-terraform-398813"
    region = "asia-southeast2"
}

variable "subnet_ip_cidr_range" {
    description = "subnet untuk dev environment"
}

resource "google_compute_network" "development_network" {
    name = "development-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet-01" {
    name = "dev-subnet-01"
    ip_cidr_range = var.subnet_ip_cidr_range
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
    secondary_ip_range {
        range_name = "secondary-range-01"
        ip_cidr_range = "192.168.10.0/24"
    }
}

# data "google_compute_network" "existing_network" {
#     name = "default"
# }

# resource "google_compute_subnetwork" "dev-subnet-02" {
#     name = "dev-subnet-02"
#     ip_cidr_range = "10.110.0.0/16"
#     network = data.google_compute_network.existing_network.id
#     region = "asia-southeast2"
# }

output "development_network_id" {
    value = google_compute_network.development_network.id
}

output "dev_subnet_01_gateway" {
    value = google_compute_subnetwork.dev-subnet-01.gateway_address
}