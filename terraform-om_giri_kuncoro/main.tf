provider "google" {
    project = "belajar-terraform-398813"
    region = "asia-southeast2"
    credentials = var.google_credentials
}

variable "google_credentials" {
    description = "service account credentials gcp saya"
    type = string
}
variable "subnet_ip_cidr_range" {
    description = "ip range untuk semua subnet"
    type = list(object({
        name = string
        range = string
    }))
}

variable "subnet_secondary_ip_cidr_range" {
    description = "secondary ip range subnet untuk dev environment"
}

resource "google_compute_network" "development_network" {
    name = "development-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet-01" {
    name = var.subnet_ip_cidr_range[0].name
    ip_cidr_range = var.subnet_ip_cidr_range[0].range
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
}

resource "google_compute_subnetwork" "dev-subnet-02" {
    name = var.subnet_ip_cidr_range[1].name
    ip_cidr_range = var.subnet_ip_cidr_range[1].range
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
}

