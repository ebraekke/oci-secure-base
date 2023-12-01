
/* Uncomment for debugging -- not needed otherwise
output "ads" {
  value = data.oci_identity_availability_domains.ads
}
*/

output "dbg_dasigret" {
  description = "This is what happens when you output a password"
  value       = local.exposed_password
  sensitive   = true
}

output "exp_vault_ocid" {
  description = "The OCID of the vault"
  value       = module.vault.vault_ocid
}

output "exp_vault_master_key_ocid" {
  description = "The OCID of the master key"
  value = module.vault.vault_master_key_ocid
}
