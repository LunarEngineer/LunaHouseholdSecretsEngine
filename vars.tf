variable "proxmox_secret_id" {
    description = "The ID of the proxmox credential secret to fetch"
    type        = string
}

variable "fixed_compute_ssh_secret_id" {
    description = "The ID of the secret containing ssh info for the fixed compute layer."
    type        = string
}
