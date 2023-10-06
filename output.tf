##################################
# Proxmox API credential Outputs #
##################################
# This exposes the outputs required to interface with the proxmox provider.
# TODO
# scrape version of bitwarden.
# scrape user of bitwarden.
output "pm_api_user" {
  description = "Proxmox user"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.text
    ),
    "PM_API_USER"
  )
}

output "pm_ssh_public_key" {
  description = "SSH Key for the server"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
        data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.hidden
    ),
    "PM_SSH_PUBLIC_KEY"
  )
}

output "pm_ssh_private_key" {
  description = "SSH Key for the server"
  sensitive   = true
  value       = replace(
    lookup(
      zipmap(
          data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.name,
          data.bitwarden_item_login.gaia_proxmox_api_credentials.field.*.hidden
      ),
      "PM_SSH_PRIVATE_KEY"
    ),
    "<N>",  # The secrets engine is dumb and can't represent newlines.
    # It also gets stupid sending newline delimited text.
    # Each newline in the key, therefore, needs the spaces filled with this stupid thing.
    "\r\n"
  )
}
