
resource oci_vault_secret my_secret {
    compartment_id   = var.compartment_ocid
    description      = var.description

    secret_content {
        content_type = "BASE64"
        name         = var.display_name 
        content      = var.content  
    }

    secret_name      = var.display_name
    vault_id         = var.vault_ocid
    key_id           = var.key_ocid
}
