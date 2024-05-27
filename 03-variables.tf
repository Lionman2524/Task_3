variable "project_id" {
  default     = "firm-retina-416800"
  description = "value of the project id"
}

variable "credentials" {
  default     = "C:\\Users\\Justin\\Terraform_Armageddon\\Wk2\\theo-armageddon\\task3\\firm-retina-416800-0100e7ea58fc.json"
  description = "value of the credentials"
  sensitive   = true
}

variable "vpn_shared_secret" {
  description = "Shared secret for the VPN connection"
  default     = "firm-retina-416800"
  sensitive   = true
}

variable "european_region" {
  default     = "europe-west1"
  description = "value of the european region"
}

variable "american_region1" {
  default     = "us-west1"
  description = "value of the american region1"
}

variable "american_region2" {
  default     = "us-east1"
  description = "value of the american region2"
}

variable "asian_region" {
  default     = "asia-east1"
  description = "value of the asian region"
}

variable "instance_type" {
  default     = "e2-medium"
  description = "value of the instance type"
}

variable "instance_image" {
  default     = "debian-cloud/debian-11"
  description = "value of the instance image"
}

variable "asian_vpn_peer_ip" {
  description = "Peer IP address of the Asian VPN Gateway"
  type        = string
  default     = ""
}

variable "europe_vpn_peer_ip" {
  description = "Peer IP address of the Europe VPN Gateway"
  type        = string
  default     = "10.150.11.0"
}

variable "vpn_gateway_ip" {
  description = "IP address of the VPN Gateway"
  type        = string
  default     = "192.168.11.0"
  #default     = "192.168.0.0"
}

variable "elastic_ip_europe" {
  description = "description of the european elastic ip address"
  default     = "elastic-ip-europe"
}

variable "elastic_ip_american1" {
  description = "description of the american1 elastic ip address"
  default     = "elastic-ip-american1"
}

variable "elastic_ip_american2" {
  description = "description of the american 2 elastic ip address"
  default     = "elastic-ip-american2"
}

variable "elastic_ip_asian" {
  description = "description of the asian elastic ip address"
  default     = "elastic-ip-asian"
}