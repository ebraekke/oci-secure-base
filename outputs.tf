
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

output "mysql_password_ocid" {
    description = "The OCID of the mysql pwd"
    value       = module.mysql_secret.secret_ocid
}

output "mongo_password_ocid" {
    description = "The OCID of the mongo pwd"
    value       = module.mongo_secret.secret_ocid
}

output "ssh_key_ocid" {
    description = "The OCID of the ssh key"
    value       = module.ssh_secret.secret_ocid
}

output "vault_ocid" {
    description = "The OCID of the vault"
    value       = module.vault.vault_ocid
}

/* Debug
TODO: Remove
output "debug_secret"  {
    description = "The BASE 64 encoded secret"
    value       = base64encode(tls_private_key.the_ssh_key.private_key_pem)  
    sensitive   = true 
}
*/
