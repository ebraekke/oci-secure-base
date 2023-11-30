
/* Uncomment for debugging -- not needed otherwise
output "ads" {
  value = data.oci_identity_availability_domains.ads
}
/*

/* This is what happens when you output a password
*/
output "dbg_dasigret" {
  value = local.password
  sensitive = true
}

output "exp_vault_ocid" {
  value = module.vault.vault_ocid
}

output "exp_vault_master_key_ocid" {
  value = module.vault.vault_master_key_ocid
}
