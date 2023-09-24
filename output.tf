##################################
# Proxmox API credential Outputs #
##################################
# This exposes the outputs required to interface with the proxmox provider.
# TODO
# scrape version of bitwarden.
# scrape user of bitwarden.
output "pm_api_url" {
  description = "The URL of the proxmox API"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_URL"
  )
}

output "pm_api_token_secret" {
  description = "Example map"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.hidden
    ),
    "PM_API_TOKEN_SECRET"
  )
}

output "pm_api_token_id" {
  description = "Example map"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.hidden
    ),
    "PM_API_TOKEN_ID"
  )
}