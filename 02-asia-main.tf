resource "google_compute_network" "asian_network" {
  name                    = "asian-network"
  auto_create_subnetworks = false
  #routing_mode            = "GLOBAL"
  #mtu                     = 1460
}

resource "google_compute_subnetwork" "asian_subnet" {
  name          = "asian-subnet"
  ip_cidr_range = "192.168.0.0/24"
  region        = var.asian_region
  network       = google_compute_network.asian_network.id
}

resource "google_compute_vpn_gateway" "asian_vpn_gateway" {
  name    = "asia-vpn-gateway"
  region  = var.asian_region
  network = google_compute_network.asian_network.id
}

resource "google_compute_address" "asian_vpn_gateway_ip" {
  name   = "asia-vpn-gateway-ip"
  region = var.asian_region
}

resource "google_compute_forwarding_rule" "asian_esp" {
  name        = "asia-esp"
  region      = var.asian_region
  ip_protocol = "ESP"
  ip_address  = google_compute_address.asian_vpn_gateway_ip.address
  target      = google_compute_vpn_gateway.asian_vpn_gateway.self_link
  depends_on = [ google_compute_vpn_gateway.european_vpn_gateway]
}

resource "google_compute_forwarding_rule" "asian_udp500" {
  name        = "asia-udp500"
  region      = var.asian_region
  ip_protocol = "UDP"
  ip_address  = google_compute_address.asian_vpn_gateway_ip.address
  port_range  = "500"
  target      = google_compute_vpn_gateway.asian_vpn_gateway.self_link
  depends_on = [ google_compute_vpn_gateway.european_vpn_gateway]
}

resource "google_compute_forwarding_rule" "asian_udp4500" {
  name        = "asia-udp4500"
  region      = var.asian_region
  ip_protocol = "UDP"
  ip_address  = google_compute_address.asian_vpn_gateway_ip.address
  port_range  = "4500"
  target      = google_compute_vpn_gateway.asian_vpn_gateway.self_link
  depends_on = [ google_compute_vpn_gateway.european_vpn_gateway]
}

resource "google_compute_vpn_tunnel" "asian_to_europe_tunnel" {
  name                    = "asia-to-europe-tunnel"
  region                  = var.asian_region
  target_vpn_gateway      = google_compute_vpn_gateway.asian_vpn_gateway.id
  peer_ip                 = google_compute_address.european_vpn_gateway_ip.address
  shared_secret           = var.vpn_shared_secret
  ike_version             = 2
  local_traffic_selector  = ["192.168.11.0/24"]
  remote_traffic_selector = ["10.150.11.0/24"]
  depends_on = [
    google_compute_forwarding_rule.asian_esp,
    google_compute_forwarding_rule.asian_udp500
  ]
}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
}