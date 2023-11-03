##################################
# Proxmox API credential Outputs #
##################################
# This exposes the outputs required to interface with the proxmox provider.
# TODO
# scrape version of bitwarden.
# scrape user of bitwarden.
output "pm_api_user" {
  description = "Proxmox user"
  sensitive   = false
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_USER"
  )
}

output "pm_api_port" {
  description = "The port for the Proxmox server"
  sensitive   = false
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_PORT"
  )
}

output "pm_api_ip" {
  description = "The ip for the Proxmox server"
  sensitive   = false
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_IP"
  )
}

output "pm_api_token_id" {
  description = "The token ID for the Proxmox server"
  sensitive   = false
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_TOKEN_ID"
  )
}

output "pm_api_token_secret" {
  description = "The token secret for the Proxmox server"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.hidden
    ),
    "PM_API_TOKEN_SECRET"
  )
}
