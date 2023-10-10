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

output "fixed_compute_public_key" {
  description = "SSH Key for the fixed compute layer"
  sensitive   = true
  value       = lookup(
    zipmap(
        data.bitwarden_item_login.fixed_compute_ssh_credentials.field.*.name,
        data.bitwarden_item_login.fixed_compute_ssh_credentials.field.*.hidden
    ),
    "ssh_public_key"
  )
}

output "fixed_compute_private_key" {
  description = "SSH Key for the fixed compute layer"
  sensitive   = true
  value       = replace(
    lookup(
      zipmap(
          data.bitwarden_item_login.fixed_compute_ssh_credentials.field.*.name,
          data.bitwarden_item_login.fixed_compute_ssh_credentials.field.*.hidden
      ),
      "ssh_private_key"
    ),
    "<N>",  # The secrets engine is dumb and can't represent newlines.
    # It also gets stupid sending newline delimited text.
    # Each newline in the key, therefore, needs the spaces filled with this stupid thing.
    "\n"
  )
}
