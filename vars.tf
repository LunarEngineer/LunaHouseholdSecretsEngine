variable "provider" {
  description = "The bitwarden provider."
  type        = string
  default     = "maxlaverse/bitwarden"
}

variable "provider_version" {
  description = "The version of the provider."
  type        = string
  default     = "0.7.0"
}

variable "proxmox_secret_id" {
    description = "The ID of the proxmox credential secret to fetch"
    type        = string
}