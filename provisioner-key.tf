resource "bitwarden_folder" "fixed_compute_layer_secrets" {
  name = "LunaHouseholdCluster/FixedComputeSecrets"
}

# Note that this is not a secure key and should not be used in a secure env.
# Here in my fixed compute layer the risk is relatively low, and I will revoke the key.
# Somehow.
resource "tls_private_key" "fixed_compute_provisioning_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

data "tls_public_key" "fixed_compute_provisioning_public_key" {
    private_key_pem = tls_private_key.fixed_compute_provisioning_private_key.private_key_pem
}

resource "bitwarden_item_login" "fixed_compute_temporary_provisioner" {
  folder_id = resource.bitwarden_folder.fixed_compute_layer_secrets.id
  name      = "FixedComputeProvisionerLogin"
  username  = "fixed-compute-provisioner@pve"
  field {
    name   = "ssh_private_key"
    hidden = tls_private_key.fixed_compute_provisioning_private_key.private_key_openssh
  }
  field {
    name   = "ssh_public_key"
    hidden = tls_public_key.fixed_compute_provisioning_public_key.public_key_ssh
  }
}
