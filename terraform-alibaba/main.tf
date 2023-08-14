terraform {
  required_providers {
    alicloud = {
        source  = "aliyun/alicloud"
        version = "1.209.0"
    }
  }
}

provider "alicloud" {
  access_key    = "${var.access.key}"
  secret_key    = "${var.secret.key}"
  region        = "${var.region}"
}

data "alicloud_instance_types" "c2g4" {
  cpu_core_count    = 2
  memory_size       = 4
}

data "alicloud_images" "default" {
  name_regex    = "^ubuntu_18.*_64"
  most_recent   = true
  owners        = "system"
}

# Create a web server
resource "alicloud_instance" "web" {
  image_id             = "${data.alicloud_images.default.images.0.id}"
  internet_charge_type = "PayByBandwidth"

  instance_type        = "${data.alicloud_instance_types.c2g4.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
  vswitch_id           = "vsw-abc12345"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id      = "vpc-abc12345"
}