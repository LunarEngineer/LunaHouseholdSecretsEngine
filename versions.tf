terraform {
  required_providers {
    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "0.7.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}