
data "bitwarden_item_login" "gaia_proxmox_api_credentials" {
  id = var.proxmox_secret_id
}

data "bitwarden_item_login" "fixed_compute_credentials" {
  id = var.fixed_compute_secret_id
}
