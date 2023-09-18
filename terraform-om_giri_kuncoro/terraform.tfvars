# BEST PRACTICES FOR TERRAFORM INPUT VARIABLE
subnet_ip_cidr_range = [
    {range: "10.160.0.0/16", name: "dev-subnet-01"},
    {range: "10.170.0.0/16", name: "dev-subnet-02"},

]
subnet_secondary_ip_cidr_range = "192.168.20.0/24"
network_name = "development-network"
# subnet_01_name = "dev-subnet-01"
# subnet_02_name = "dev-subnet-02"

google_credentials = "./tf-serviceaccount.json"