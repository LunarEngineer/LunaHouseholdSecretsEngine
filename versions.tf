terraform {
  required_providers {
    bitwarden = {
      source = var.provider
      version = var.provider_version
    }
  }
}
