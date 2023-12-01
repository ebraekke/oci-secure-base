
/*
data "oci_kms_vault" "my_vault" {
    vault_id = oci_kms_vault.my_vault.id
}

data "oci_kms_key" "my_vault_master_key" {
    key_id              = oci_kms_key.my_master_key.id
    management_endpoint = data.oci_kms_vault.my_vault.management_endpoint
}
*/
