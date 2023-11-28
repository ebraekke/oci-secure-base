
data "oci_kms_vault" "test_vault" {
    #Required
    vault_id = oci_kms_vault.my_vault.id
}


